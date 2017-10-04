connection: "nfl_shiggins"

# Bughunt Git Branch Test 1

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

persist_for: "2 hours"
# explore: new_urls {
#   join: team {
#     sql_on: ${new_urls.url} LIKE ('%'||${team.name}||'%') ;;
#     relationship: one_to_one
# }
# }
explore: agg_play {
  fields: [ALL_FIELDS*]

#   always_filter: {
#     filters: {
#       field: game.season_year
#       value: "2013"
#     }
#   }

  join: play {
    type: left_outer
    sql_on: ${agg_play.play_id}=${play.play_id} ;;
    relationship: one_to_one
  }
  join: drive{
    type: left_outer
    sql_on: ${play.drive_id}=${drive.drive_id} ;;
    relationship: many_to_one
  }
  join: game {
    type: left_outer
    sql_on: ${drive.gsis_id}=${game.gsis_id};;
    relationship: many_to_one
  }
  join: yards {
    type: left_outer
    sql_on: ${play.play_id}=${yards.play_id} AND ${play.gsis_id}=${yards.gsis_id} and ${play.drive_id} = ${yards.drive_id};;
    relationship: one_to_one
  }
}

explore: drive {
  join:  play {
    sql_on: ${drive.drive_id}=${play.drive_id};;
    relationship: one_to_many
    type: left_outer
  }

}


explore: home_team {
  from: game
  fields: [ALL_FIELDS*, -away_team.home_team,-home_team.away_team]
  label: "Team vs Team"
  view_label: "Team"
  sql_always_where:  ${home_team.home_team} != 'UNK';;
  join: away_team {
    fields: [away_team.away_team]
    view_label: "Team"
    from: game
    sql_on: ${home_team.home_team}=${away_team.home_team} and ${home_team.away_team}=${away_team.away_team};;
    relationship: many_to_one
  }
  join: weather {
    sql_on: ${home_team.home_team} = ${weather.home_team_abbr} and ${home_team.start_date} = ${weather.game_played_date} ;;
    relationship: one_to_one
  }
}


explore: game {
  sql_always_where: ${season_year}<=2013 ;;
  join: weather {
    sql_on:
    ${game.home_team}=${weather.home_team_corr}
    AND ${game.start_date}=${weather.game_played_date}

    ;;
    type: inner
    relationship: one_to_one
  }
  join: play_player {
    type: inner
    sql_on: ${game.gsis_id}=${play_player.gsis_id};;
    relationship: one_to_many
}
}

# don't need right now, Game is joined in to other explores but haven't needed it on its own

# explore: meta {} # as with Game, no need for meta on its own.

#### Base Explore ####                  Use this to query summary stats year on year as the game view stores the year
explore: play {
#   suggestions: yes
  join: drive {
    type: left_outer
    sql_on: ${play.drive_id} = ${drive.drive_id} ;;
    relationship: many_to_one
  }
}


explore: play_player {
  fields: [ALL_FIELDS*]

  join: play {
    type: inner
    sql_on: ${play_player.play_id} = ${play.play_id} AND ${play_player.gsis_id} = ${play.gsis_id} AND ${play_player.drive_id} = ${play.drive_id};;
    relationship: many_to_one
  }

  join: drive {
    type: inner
    sql_on: ${play_player.drive_id} = ${drive.drive_id} AND ${play_player.gsis_id} = ${drive.gsis_id};;
    relationship: many_to_one
  }

  join: player {
    type: inner
    sql_on: ${play_player.player_id} = ${player.player_id} ;;
    relationship: many_to_one
  }
  join: game {
    type: inner
    sql_on: ${game.gsis_id}=${play_player.gsis_id};;
    relationship: many_to_one
  }
#   join: yards {
#     type: left_outer
#     sql_on: ${play.play_id}=${yards.play_id} AND ${play.gsis_id}=${yards.gsis_id} and ${play.drive_id} = ${yards.drive_id};;
#     relationship: one_to_one
#   }
#   join:  player_avatars {
#     type: left_outer
#     relationship: one_to_one
#     sql_on: ${player_avatars.player_id}=${play_player.player_id} ;;
#   }
}

datagroup: etl_schedule {
  sql_trigger: select max(id) from etl_run ;;
  max_cache_age: "48 hours"
}
explore: dt_running_back_facts {
  group_label: "Positions"
  label: "Running Backs"
  persist_with: etl_schedule
  join: play_player {
    type: inner
    sql_on: ${play_player.player_id}=${dt_running_back_facts.player_player_id} ;;
    relationship: one_to_many
  }
  join: play {
    type: inner
    sql_on: ${play_player.play_id} = ${play.play_id} AND ${play_player.gsis_id} = ${play.gsis_id} AND ${play_player.drive_id} = ${play.drive_id};;
    relationship: many_to_one
  }
  join: player {
    type: inner
    sql_on: ${dt_running_back_facts.player_player_id} = ${player.player_id} ;;
    relationship: many_to_one
  }
}

explore: dt_quarterback_facts {
  group_label: "Positions"
  label: "QuarterBacks"
  persist_with: etl_schedule
  join: play_player {
    type: inner
    sql_on: ${play_player.player_id}=${dt_quarterback_facts.player_player_id} ;;
    relationship: one_to_many
  }
  join: play {
    type: inner
    sql_on: ${play_player.play_id} = ${play.play_id} AND ${play_player.gsis_id} = ${play.gsis_id} AND ${play_player.drive_id} = ${play.drive_id};;
    relationship: many_to_one
  }
  join: player {
    type: inner
    sql_on: ${dt_quarterback_facts.player_player_id} = ${player.player_id} ;;
    relationship: many_to_one
  }
}

explore: player {}

explore: team {
  conditionally_filter: {
    filters: {
      field: play_player.team
      value: "UNK"
    }
    unless: [team_id]
    # I need to find a better way to have the team logo default to the NFL logo rather than setting the team to 'UNK'
  }
  join: play_player {
    type: left_outer
    sql_on: ${team.team_id}=${play_player.team} ;;
    relationship: one_to_many
  }}

# explore: player_avatars {} --Later on I'm going to try compile a list of player avatars and have them
#display if they're queried from the DB
