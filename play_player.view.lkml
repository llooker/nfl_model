  view: play_player {
    view_label: "Plays by Player"
    label: "Player Plays"
    sql_table_name: public.play_player ;;

    dimension: compound_primary_key {
      primary_key: yes
      sql: ${gsis_id} || '-' || ${play_id} || '-' ||${player_id} ;;
      hidden: yes
    }

    dimension: defense_ast {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_ast ;;
    }

    dimension: defense_ffum {
      type: number
      group_label: "Defense"

      sql: ${TABLE}.defense_ffum ;;
    }

    dimension: defense_fgblk {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_fgblk ;;
    }

    dimension: defense_frec {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_frec ;;
    }

    dimension: defense_frec_tds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_frec_tds ;;
    }

    dimension: defense_frec_yds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_frec_yds ;;
    }

    dimension: defense_int {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_int ;;
    }

    dimension: defense_int_tds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_int_tds ;;
    }

    dimension: defense_int_yds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_int_yds ;;
    }

    dimension: defense_misc_tds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_misc_tds ;;
    }

    dimension: defense_misc_yds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_misc_yds ;;
    }

    dimension: defense_pass_def {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_pass_def ;;
    }

    dimension: defense_puntblk {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_puntblk ;;
    }

    dimension: defense_qbhit {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_qbhit ;;
    }

    dimension: defense_safe {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_safe ;;
    }

    dimension: defense_sk {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_sk ;;
    }

    dimension: defense_sk_yds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_sk_yds ;;
    }

    dimension: defense_tkl {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_tkl ;;
    }

    dimension: defense_tkl_loss {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_tkl_loss ;;
    }

    dimension: defense_tkl_loss_yds {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_tkl_loss_yds ;;
    }

    dimension: defense_tkl_primary {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_tkl_primary ;;
    }

    dimension: defense_xpblk {
      type: number
      group_label: "Defense"
      sql: ${TABLE}.defense_xpblk ;;
    }

    dimension: drive_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.drive_id ;;
    }

    dimension: fumbles_forced {
      type: number
      group_label:"Fumbles"
      sql: ${TABLE}.fumbles_forced ;;
    }

    dimension: fumbles_lost {
      type: number
      group_label:"Fumbles"
      sql: ${TABLE}.fumbles_lost ;;
    }

    dimension: fumbles_notforced {
      type: number
      group_label:"Fumbles"
      sql: ${TABLE}.fumbles_notforced ;;
    }

    dimension: fumbles_oob {
      type: number
      group_label:"Fumbles"
      sql: ${TABLE}.fumbles_oob ;;
    }

    dimension: fumbles_rec {
      type: number
      group_label:"Fumbles"
      sql: ${TABLE}.fumbles_rec ;;
    }

    dimension: fumbles_rec_tds {
      type: number
      group_label:"Fumbles"
      sql: ${TABLE}.fumbles_rec_tds ;;
    }

    dimension: fumbles_rec_yds {
      type: number
      group_label:"Fumbles"
      sql: ${TABLE}.fumbles_rec_yds ;;
    }

    dimension: fumbles_tot {
      type: number
      group_label:"Fumbles"

      sql: ${TABLE}.fumbles_tot ;;
      drill_fields: [detail*]

    }

    dimension: gsis_id {
      type: string
      sql: ${TABLE}.gsis_id ;;
    }

    dimension: kicking_all_yds {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_all_yds ;;
    }

    dimension: kicking_downed {
      type: number
      group_label: "Kicking"

      sql: ${TABLE}.kicking_downed ;;
    }

    dimension: kicking_fga {
      type: number
      group_label: "Kicking"

      sql: ${TABLE}.kicking_fga ;;
    }

    dimension: kicking_fgb {
      type: number
      group_label: "Kicking"

      sql: ${TABLE}.kicking_fgb ;;
    }

    dimension: kicking_fgm {
      group_label: "Kicking"

      type: number
      sql: ${TABLE}.kicking_fgm ;;
    }

    dimension: kicking_fgm_yds {
      type: number

      group_label: "Kicking"
      sql: ${TABLE}.kicking_fgm_yds ;;
    }

    dimension: kicking_fgmissed {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_fgmissed ;;
    }

    dimension: kicking_fgmissed_yds {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_fgmissed_yds ;;
    }

    dimension: kicking_i20 {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_i20 ;;
    }

    dimension: kicking_rec {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_rec ;;
    }

    dimension: kicking_rec_tds {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_rec_tds ;;
    }

    dimension: kicking_tot {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_tot ;;
    }

    dimension: kicking_touchback {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_touchback ;;
    }

    dimension: kicking_xpa {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_xpa ;;
    }

    dimension: kicking_xpb {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_xpb ;;
    }

    dimension: kicking_xpmade {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_xpmade ;;
    }

    dimension: kicking_xpmissed {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_xpmissed ;;
    }

    dimension: kicking_yds {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kicking_yds ;;
    }

    dimension: kickret_fair {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kickret_fair ;;
    }

    dimension: kickret_oob {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kickret_oob ;;
    }

    dimension: kickret_ret {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kickret_ret ;;
    }

    dimension: kickret_tds {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kickret_tds ;;
    }

    dimension: kickret_touchback {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kickret_touchback ;;
    }

    dimension: kickret_yds {
      type: number
      group_label: "Kicking"
      sql: ${TABLE}.kickret_yds ;;
    }

    dimension: passing_att {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_att ;;
    }

    dimension: passing_cmp {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_cmp ;;
    }

    dimension: passing_cmp_air_yds {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_cmp_air_yds ;;
    }

    dimension: passing_incmp {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_incmp ;;
    }

    dimension: passing_incmp_air_yds {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_incmp_air_yds ;;
    }

    dimension: passing_int {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_int ;;
      drill_fields: [detail*]
      }

    dimension: passing_sk {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_sk ;;
    }

    dimension: passing_sk_yds {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_sk_yds ;;
    }

    dimension: passing_tds {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_tds ;;
    }

    dimension: passing_twopta {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_twopta ;;
    }

    dimension: passing_twoptm {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_twoptm ;;
    }

    dimension: passing_twoptmissed {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_twoptmissed ;;
    }

    dimension: passing_yds {
      type: number
      group_label:"Passing"
      sql: ${TABLE}.passing_yds ;;
    }

    dimension: play_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.play_id ;;
    }

    dimension: player_id {
      type: string
      # hidden: yes
      sql: ${TABLE}.player_id ;;
    }

    dimension: punting_blk {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.punting_blk ;;
    }

    dimension: punting_i20 {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.punting_i20 ;;
    }

    dimension: punting_tot {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.punting_tot ;;
    }

    dimension: punting_touchback {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.punting_touchback ;;
    }

    dimension: punting_yds {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.punting_yds ;;
    }

    dimension: puntret_downed {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.puntret_downed ;;
    }

    dimension: puntret_fair {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.puntret_fair ;;
    }

    dimension: puntret_oob {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.puntret_oob ;;
    }

    dimension: puntret_tds {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.puntret_tds ;;
    }

    dimension: puntret_tot {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.puntret_tot ;;
    }

    dimension: puntret_touchback {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.puntret_touchback ;;
    }

    dimension: puntret_yds {
      type: number
      group_label:"Punting"
      sql: ${TABLE}.puntret_yds ;;
    }

    dimension: receiving_rec {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_rec ;;
    }

    dimension: receiving_tar {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_tar ;;
    }

    dimension: receiving_tds {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_tds ;;
    }

    dimension: receiving_twopta {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_twopta ;;
    }

    dimension: receiving_twoptm {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_twoptm ;;
    }

    dimension: receiving_twoptmissed {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_twoptmissed ;;
    }

    dimension: receiving_yac_yds {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_yac_yds ;;
    }

    dimension: receiving_yds {
      type: number
      group_label:"Receiving"
      sql: ${TABLE}.receiving_yds ;;
    }

    dimension: rushing_att {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_att ;;
    }

    dimension: rushing_loss {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_loss ;;
    }

    dimension: rushing_loss_yds {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_loss_yds ;;
    }

    dimension: rushing_tds {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_tds ;;
    }

    dimension: rushing_twopta {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_twopta ;;
    }

    dimension: rushing_twoptm {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_twoptm ;;
    }

    dimension: rushing_twoptmissed {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_twoptmissed ;;
    }

    dimension: rushing_yds {
      type: number
      group_label:"Rushing"
      sql: ${TABLE}.rushing_yds ;;
    }

    dimension: count_plays_run {
      type: string
      sql: (SELECT
            COUNT(play_player.team)  AS count_teams
            FROM public.play_player  AS play_player
            INNER JOIN public.game  AS game ON game.gsis_id=play_player.gsis_id
            WHERE (((game.season_year ) = 2015) AND ((play_player.team ) = 'SD'))
            OR
            (((game.season_year ) = 2016) AND (((play_player.team ) = 'SF')
            OR ((play_player.team ) = 'ARI')))
             );;
    }

    dimension: team {
      type: string
      sql: ${TABLE}.team ;;
    }
#
#     measure: total_yards {
#       sql: (${rushing_yds}+${passing_yds}) ;;
#       type: number
#     }
#     measure: average_yards {
#       type: number
#       sql: 1.0* ((${total_yards})/2);;
#       value_format_name: decimal_2
#     }
#

    measure: average_passing_yards {
    type: average
      group_label: "Passing Stats"
    sql:  ${passing_yds};;
    value_format_name: decimal_2
      filters: {
        field: passing_att
        value: "1"
      }
    }

    measure: average_rushing_yards {
      type: average
      value_format_name: decimal_2
      group_label: "Rushing Stats"
      sql:  ${rushing_yds};;
      filters: {
        field: rushing_att
        value: "1"
      }
    }

#Rushing Stats
    measure: total_rushing_yds {
      type: sum
      sql: ${rushing_yds} ;;
      value_format_name: decimal_2
      group_label: "Rushing Stats"
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      filters: {
        field: rushing_att
        value: "1"
      }
      drill_fields: [detail*]

    }
    measure: total_rushing_tds {
      type: sum
      sql: ${rushing_tds} ;;
      value_format_name: decimal_2
      group_label: "Rushing Stats"
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      drill_fields: [detail*]

    }
    measure: total_rushing_fumbles {
      type: sum
      sql: ${fumbles_lost} ;;
      value_format_name: decimal_2
      group_label: "Rushing Stats"
      html: {% if value > 5 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value >3 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      filters: {
        field: rushing_att
        value: "1"
      }
      drill_fields: [detail*]

    }
    measure: total_passing_att {
      type: sum
      sql: ${passing_att} ;;
      value_format_name: decimal_2
      group_label: "Passing Stats"
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      filters: {
        field: passing_att
        value: "1"
      }
      drill_fields: [detail*]

    }
    measure: count_rushing_att {
      type: count
      value_format_name: decimal_2
      group_label: "Rushing Stats"
      filters: {
        field: rushing_att
        value: "1"
      }
    }
    measure: rush_perc {
      type: number
      value_format_name: decimal_2
      group_label: "Rushing Stats"
      sql: 1.0*${total_rushing_att}/nullif(${count},0) ;;
    }
#Passing Stats
    measure: total_passing_yds {
      type: sum
      value_format_name: decimal_2
      group_label: "Passing Stats"
      sql: ${passing_yds} ;;
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      filters: {
        field: passing_att
        value: "1"
      }
      drill_fields: [detail*]

    }
    measure: total_passing_tds {
      type: sum
      sql: ${passing_tds} ;;
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      drill_fields: [detail*]

    }



    measure: count_passing_att {
      type: count
      value_format_name: decimal_2
      group_label: "Passing Stats"
      filters: {
        field: passing_att
        value: "1"
      }
    }
    measure: total_rushing_att {
      type: sum
      value_format_name: decimal_2
      group_label: "Rushing Stats"
      sql: COALESCE(${rushing_att},0) ;;
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      filters: {
        field: rushing_att
        value: "1"
      }
      drill_fields: [detail*]

    }
    measure: pass_perc {
      type: number
      sql: 1.0*${total_rushing_att}/nullif(${count},0) ;;
      value_format_name: percent_2
      group_label: "Passing Stats"
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      drill_fields: [detail*]

    }
    measure: total_passing_comp {
      type: sum
      sql: COALESCE(${passing_cmp},0) ;;
      value_format_name: decimal_2
      group_label: "Passing Stats"
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      drill_fields: [detail*]

    }
    measure: total_passing_ints {
      type: sum
      sql: ${passing_int} ;;
      value_format_name: decimal_2
      group_label: "Passing Stats"
      html: {% if value > 10 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value > 5 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      drill_fields: [detail*]

    }
#Receiving Stats
    measure: total_receiving_tar {
      type: sum
      sql: COALESCE(${receiving_tar},0) ;;
      html: {% if value < 50 %}
          <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
          {% elsif value < 60 %}
          <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
          {% else %}
          <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
          {% endif %}
          ;;
      drill_fields: [detail*]

    }
    measure: total_receiving_tds {
      type: sum
      sql: ${receiving_tds} ;;
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      drill_fields: [detail*]

    }
    measure: total_receiving_rec {
      type: sum
      sql: ${receiving_rec} ;;
      html: {% if value < 50 %}
            <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% elsif value < 60 %}
            <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% else %}
            <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
            {% endif %}
            ;;
      drill_fields: [detail*]

    }
    measure: count {
      type: count
      drill_fields: [detail*]
    }

    # ----- Sets of fields for drilling ------
    set: detail {
      fields: [
        play.play_id,
        drive.drive_id,
        player.last_name,
        player.first_name,
        player.full_name,
        player.gsis_name,
        player.player_id,
        play.description
      ]
    }
  }
