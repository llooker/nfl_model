# this view is just here because the URLs used to load the logos are hosted on an image server.
# The player avatars come directly from NFL.com but for some reason team logos can't be referenced the same way
view: new_urls {
  sql_table_name: looker_scratch.new_urls ;;

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: team {
  derived_table: {
    sql: SELECT
        new_urls.url  AS "new_urls.url",
        team.name  AS "team.name",
        team.city  AS "team.city",
        team.team_id  AS "team.team_id"
      FROM looker_scratch.new_urls  AS new_urls
      LEFT JOIN public.team  AS team ON new_urls.url LIKE ('%'||team.name||'%')

      GROUP BY 1,2,3,4
      ORDER BY 1
      LIMIT 500
       ;;
      # indexes: ["team_id"] re-add if persisting, but this is tiny data, no real need to persist ATM
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: logo {
    type: string
    sql: ${TABLE}."new_urls.url" ;;
    html: <img src="{{rendered_value}}" height="80"> ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."team.name" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."team.city" ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}."team.team_id" ;;
  }

  set: detail {
    fields: [logo, name, city, team_id]
  }
}
