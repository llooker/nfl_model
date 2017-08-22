include: "player.view.lkml"

# The way this works is that every player in the NFL has a player_id and esb_id. The esb_id exists on each players page and is used for referencing their individual portrait.
# To get this I had to do some Python scraping of the NFL site and load this ID via ETL and then reference it via a static URL below.
view: player_avatars {
  extends: [player]


  dimension: portrait {
    label: "Player Portrait"
    sql: ${TABLE}.esb_id ;;
    type: string
    html: <img height=80 width=80 src="http://static.nfl.com/static/content/public/static/img/fantasy/transparent/200x200/{{rendered_value}}}}.png">
      ;;
  }

  dimension: esb_id {
    sql: ${TABLE}.esb_id;;
    type: string
  }

  dimension: player_id {
    sql: ${TABLE}.player_id ;;
    hidden: yes
    primary_key: yes
  }
  dimension: name {
    label: "Player Name"
    sql: ${first_name} || ' ' || ${TABLE}.last_name ;;
  }

  dimension: first_name {
    label: "Player First Name"
    sql:${TABLE}.first_name;;
    }


#   set: detail {
#     fields: [EXTENDED*, portrait]
#   }
}
