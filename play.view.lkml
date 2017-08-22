# This is different from play_player in that it's a description of the play itself, not a summary of the stats involved.
# After some playing, I managed to infer the actual yardline, YTG and expected points stuff. Kind of interesting when doing score forecasting.
# I'm trying to get some real time % probability stuff going on while games are being played using Burnt Sushi's NFL Game Python and some Vegas line stuff.

view: play {
  sql_table_name: public.play ;;

  dimension: compound_primary_key {
    sql: ${play_id}||'-'||${gsis_id} ;;
    primary_key: yes
    hidden: yes
  }
  dimension: play_id {
    type: number
    sql: ${TABLE}.play_id ;;
  }
  dimension: is_touchdown{
    group_label: "Scoring Plays"
    type: yesno
    sql: (LOWER(${description}) LIKE '%touchdown%') AND (LOWER(${description}) NOT LIKE '%intercepted%') ;;
  }

  dimension: formation {
    type: string
    sql: CASE WHEN lower(${description}) LIKE '%no huddle%shotgun%' THEN 'No Huddle, Shotgun'
          WHEN lower(${description}) LIKE '%no huddle%under centre%' THEN 'No Huddle, Under Centre'
          WHEN lower(${description}) LIKE '%shotgun%' THEN 'Shotgun'
          WHEN lower(${description}) LIKE '%under centre%' THEN 'Under Centre'
          WHEN lower(${description}) LIKE '%punt%' THEN 'Punt'
          WHEN lower(${description}) LIKE '%field goal%' THEN 'Field Goal'
          ELSE 'Under Centre'
          END;;
    drill_fields: [description]
  }

  dimension: pass_play_type {
    type: string
    sql:  CASE WHEN (lower(${description}) LIKE '%short left%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Short Left'
      WHEN (lower(${description}) LIKE '%short middle%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Short Middle'
      WHEN (lower(${description}) LIKE '%short right%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Short Right'
      WHEN (lower(${description}) LIKE '%deep left%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Deep Left'
      WHEN (lower(${description}) LIKE '%deep middle%' AND lower(${description}) NOT LIKE '%incomplete%') THEN 'Deep Middle'
      WHEN (lower(${description}) LIKE '%deep right%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Deep Right'
      WHEN (lower(${description}) LIKE '%pass to%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Pass'
      WHEN (lower(${description}) LIKE '%pass left%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Pass Left'
      WHEN (lower(${description}) LIKE '%pass middle%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Pass Middle'
      WHEN (lower(${description}) LIKE '%pass right%' AND lower(${description}) NOT LIKE '%incomplete%')  THEN 'Pass Right'
      END ;;
    drill_fields: [description]

}

    dimension: run_play_type {
    type: string
    sql:  CASE
      WHEN lower(${description}) LIKE '%left tackle%' THEN 'Left Tackle'
      WHEN lower(${description}) LIKE '%up the middle%' THEN 'Centre'
      WHEN lower(${description}) LIKE '%left guard%' THEN 'Left Guard'
      WHEN lower(${description}) LIKE '%right tackle%' THEN 'Right Tackle'
      WHEN lower(${description}) LIKE '%right guard%' THEN 'Right Guard'
      WHEN lower(${description}) LIKE '%left end%' THEN 'Left End'
      WHEN lower(${description}) LIKE '%right end%' THEN 'Right End'
      WHEN lower(${description}) LIKE '%scramble%' THEN 'Scramble'
      END;;
  }
  dimension: other_play_type {
    sql: CASE
      WHEN lower(${description}) LIKE '%kicks%' THEN 'Kickoff'
      WHEN lower(${description}) LIKE '%sacked%' THEN 'Sack'
      WHEN lower(${description}) LIKE '%punt%' THEN 'Punt'
      WHEN lower(${description}) LIKE '%field goal%' THEN 'Field Goal'
      WHEN lower(${description}) LIKE '%no play%' THEN 'No Play'
      WHEN lower(${description}) LIKE '%incomplete%' THEN 'Incomplete Pass'
      WHEN lower(${description}) LIKE '%fumble%' THEN 'Fumble'
      WHEN lower(${description}) LIKE '%penalty%' THEN 'Penalty'
      WHEN lower(${description}) LIKE '%two-point%' THEN 'Two Point'
      WHEN lower(${description}) LIKE '%kneel%' THEN 'Kneel'
      WHEN lower(${description}) LIKE '%spike%' THEN 'Spike'
      WHEN lower(${description}) LIKE '%intercepted%' THEN 'Interception'
      WHEN lower(${description}) LIKE '%extra point%' THEN 'Extra Point'
      ELSE 'Other'
      END
          ;;
      type: string
}
  dimension: yardlines {
    sql: CAST(${TABLE}.yardlines as numeric) ;;
    type: number
  }

  dimension: is_safety {
    group_label: "Scoring Plays"
    type: yesno
    sql:  LOWER(${description}) LIKE '%safety%';;
  }

  dimension: is_fg {
    group_label: "Scoring Plays"
    type: yesno
    sql:  LOWER(${description}) LIKE '%field goal%good%';;
  }

  dimension: is_pick6 {
    group_label: "Scoring Plays"
    type: yesno
    sql:  LOWER(${description}) LIKE '%intercepted%touchdown%';;
  }



  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: penalty_type {
    type: string
    sql:
    CASE
    WHEN ${description} LIKE '%Offensive Holding,%' THEN 'Offensive Holding'
    WHEN ${description} LIKE '%Defensive Holding,%' THEN 'Defensive Holding'
    WHEN ${description} LIKE '%Unsportsmanlike Conduct,%' THEN 'Unsportsmanlike Conduct'
    WHEN ${description} LIKE '%Defensive Pass Interference,%' THEN 'Defensive Pass Interference'
    WHEN ${description} LIKE '%Offensive Pass Interference,%' THEN 'Offensive Pass Interference'
    WHEN ${description} LIKE '%Intentional Grounding,%' THEN 'Intentional Grounding'
    WHEN ${description} LIKE '%Offensive Holding%' THEN 'Offensive Holding'
    WHEN ${description} LIKE '%Unnecessary Roughness,%' THEN 'Unnecessary Roughness'
    WHEN ${description} LIKE '%Personal Foul,%' THEN 'Personal Foul'
    WHEN ${description} LIKE '%False Start,%' THEN 'False Start'
    WHEN ${description} LIKE '%Face Mask%' THEN 'Face Mask'
    WHEN ${description} LIKE '%Illegal Use of Hands,%' THEN 'Illegal Use Of Hands'
    WHEN ${description} LIKE '%Taunting,%' THEN 'Taunting'
    WHEN ${description} LIKE '%Roughing the Passer,%' THEN 'Roughing the Passer'
    WHEN ${description} LIKE '%Horse Collar%' THEN 'Horse Collar'
    WHEN ${description} LIKE '%Illegal Block%' THEN 'Illegal Block'
    WHEN ${description} LIKE '%Roughing the Kicker,%' THEN 'Roughing the Kicker'
    WHEN ${description} LIKE '%Chop Block,%' THEN 'Chop Block'
    WHEN ${description} LIKE '%Tripping,%' THEN 'Tripping'

    ELSE 'Other/No Penalty'
    END
 ;;
    drill_fields: [description, play.player]
  }

  dimension: is_extra_point {
    group_label: "Scoring Plays"
    type: yesno
    sql: ${description} LIKE '%extra point%' AND ${description} NOT LIKE '%TWO-POINT CONVERSION ATTEMPT%' ;;
  }
  dimension: down {
    type: number
    sql: ${TABLE}.down ;;
  }

  dimension: drive_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.drive_id ;;
  }

  dimension: is_two_point_conversion_attempt {
  type: yesno
  sql: ${description} LIKE '%TWO-POINT CONVERSION ATTEMPT%' ;;
  }


  dimension: is_active_play {
    type: yesno
    sql: ${description} NOT LIKE '%extra point%' AND ${description} NOT LIKE '%TWO-POINT CONVERSION ATTEMPT%' AND ${is_penalty} = 'no'   AND ${down} IS NOT NULL;;
  }

  measure: count_active_plays {
    type: count
    filters: {
      field: is_active_play
      value: "yes"
    }
  }
  dimension: is_first_down_conv {
    type: yesno
    group_label: "1st Down"
    sql: ${TABLE}.first_down =1 ;;
  }

  measure: first_down_conv_count {
    type: count
    filters:{
      field: is_first_down_conv
      value: "yes"
    }}
  measure: first_down_conv_perc {
    type: number
    value_format_name: decimal_4

    sql: 1.0*${first_down_conv_count}/${count} ;;
  }
  dimension: is_first_down {
    type: yesno
    group_label: "1st Down"
    sql: ${TABLE}.down = 1 ;;
  }

  dimension: is_second_down {
    type: yesno
    group_label: "2nd Down"
    sql: ${TABLE}.down = 2 ;;
  }

  dimension: is_fourth_down_att {
    group_label: "4th Down"
    type: yesno
    sql: ${TABLE}.fourth_down_att =1 ;;
  }

  dimension: is_fourth_down_conv {
    group_label: "4th Down"
    type: yesno
    sql: ${TABLE}.fourth_down_conv =1;;
  }

  dimension: is_fourth_down_failed {
    group_label: "4th Down"
    type: yesno
    sql: ${TABLE}.fourth_down_failed =1 ;;
  }

  dimension: gsis_id {
    type: string
    sql: ${TABLE}.gsis_id ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: passing_first_down {
    type: number
    sql: ${TABLE}.passing_first_down =1;;
  }

  dimension: is_penalty {
    type: yesno
    sql: ${TABLE}.penalty = 1;;
  }

  dimension: is_penalty_first_down {
    type: yesno
    sql: ${TABLE}.penalty_first_down =1;;
  }

  dimension: penalty_yds {
    type: number
    drill_fields: [description]
    sql: ${TABLE}.penalty_yds ;;
  }

  dimension: pos_team {
    type: string
    sql: ${TABLE}.pos_team ;;
  }

  dimension: is_rushing_first_down {
    type: yesno
    sql: ${TABLE}.rushing_first_down =1;;
  }

  dimension: is_third_down_att {
    group_label: "3rd Down"
    type: yesno
    sql: ${TABLE}.third_down_att =1;;
  }

  dimension: is_third_down_conv {
    group_label: "3rd Down"
    type: yesno
    sql: ${TABLE}.third_down_conv =1;;
  }

  dimension: is_third_down_failed {
    group_label: "3rd Down"
    type: yesno
    sql: ${TABLE}.third_down_failed =1;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }
  dimension: absolute_time {
    type: number
    sql: substring(${time},',',2) ;;
  }

  dimension_group: time_inserted {
    type: time
    timeframes: [time, date, week, month, year]
    sql: ${TABLE}.time_inserted ;;
  }

  dimension_group: time_updated {
    type: time
    timeframes: [time, date, week, month, ]
    sql: ${TABLE}.time_updated ;;
  }

  dimension: timeout {
    type: yesno
    sql: ${TABLE}.timeout ;;
  }

  dimension: xp_aborted {
    type: number
    sql: ${TABLE}.xp_aborted ;;
  }

  dimension: yardline {
    type: string
#     sql:  substring('(-1)' FROM '[0-9]+') ;;
    sql: ${TABLE}.yardline;;
  }

  dimension: yards_to_go {
    type: number
    sql: ${TABLE}.yards_to_go ;;
  }
    dimension: yards_to_go_string {
      type: string
      sql: ${TABLE}.yards_to_go ;;
    }
  dimension: ytg_sampling {
    type: tier
    tiers: [5,10,15,20]
    style: integer
    sql: ${yards_to_go} ;;
  }


  dimension: state {
    type: string
    sql:
    CASE WHEN (${yards_to_go}<=5) AND ${down} = 1 THEN '1st <5'
    WHEN ${yards_to_go}<=10 AND ${down} = 1 THEN '1st<10'
    WHEN ${yards_to_go}<=15 AND ${down} = 1 THEN '1st<15'
    WHEN ${yards_to_go}<=20 AND ${down} = 1 THEN '1st<20'
    WHEN ${yards_to_go} >20 AND ${down} = 1 THEN '1st20+'
    WHEN ${yards_to_go}<=5 AND ${down} = 2 THEN '2nd <5'
    WHEN ${yards_to_go}<=10 AND ${down} = 2 THEN '2nd<10'
    WHEN ${yards_to_go}<=15 AND ${down} = 2 THEN '2nd<15'
    WHEN ${yards_to_go}<=20 AND ${down} = 2 THEN '2nd<20'
    WHEN ${yards_to_go} >20 AND ${down} = 2 THEN '2nd20+'
    WHEN ${yards_to_go}<=5 AND ${down} = 3 THEN '3rd <5'
    WHEN ${yards_to_go}<=10 AND ${down} = 3 THEN '3rd<10'
    WHEN ${yards_to_go}<=15 AND ${down} = 3 THEN '3rd<15'
    WHEN ${yards_to_go}<=20 AND ${down} = 3 THEN '3rd<20'
    WHEN ${yards_to_go} >20 AND ${down} = 3 THEN '3rd20+'
    WHEN ${yards_to_go}<=5 AND ${down} = 4 THEN '4th <5'
    WHEN ${yards_to_go}<=10 AND ${down} = 4 THEN '4th<10'
    WHEN ${yards_to_go}<=15 AND ${down} = 4 THEN '4th<15'
    WHEN ${yards_to_go}<=20 AND ${down} = 4 THEN '4th<20'
    ELSE  '4th20+'
    END;;
    drill_fields: [description]
  }


  measure: sum_penalty_yds {
    type: sum
    filters:  {
      field:  is_penalty
      value: "yes"
    }
    sql: ${penalty_yds} ;;
  }

  measure: touchdown_count {
    type: count
    filters: {
      field: is_touchdown
      value: "yes"
    }
  }


  measure: fg_count {
    type: count
    filters: {
      field: is_fg
      value: "yes"
    }
    filters: {
      field: is_active_play
      value: "yes"
    }
  }

  measure: sfty_count {
    type: count
    filters: {
      field: is_safety
      value: "yes"
    }
    filters: {
      field: is_active_play
      value: "yes"
    }
  }

  measure: pick6_count {
    type: count
    filters: {
      field: is_pick6
      value: "yes"
    }
    filters: {
      field: is_active_play
      value: "yes"
    }
  }
  measure: fg_perc {
    type: number
    value_format_name: decimal_4
    sql: 1.0*${fg_count}/nullif(${count},0) ;;
  }
  measure: pick6_perc {
    type: number
    value_format_name: decimal_4
    sql: 1.0*${pick6_count}/nullif(${count},0) ;;
  }
  measure: sfty_perc {
    type: number
    value_format_name: decimal_4
    sql: 1.0*${sfty_count}/nullif(${count},0) ;;
  }
  measure: td_perc {
    type: number
    value_format_name: decimal_4
    sql: 1.0*${touchdown_count}/nullif(${count},0) ;;
  }
  measure: expected_points {
    type: number
    sql: (${td_perc}*7)+(${fg_perc}*3);;
    drill_fields: [description]




    html: {% if value <1 %}
        <div style="color: black; background-color: #dc7350; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% elsif value < 3 %}
        <div style="color: black; background-color: #e9b404; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% else %}
        <div style="color: black; background-color: #49cec1; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% endif %}
      ;;
#     value_format_name: decimal_4
      value_format: "#.00"
    }

    measure: expected_points_excl_fg {
      type: number
      sql: (${td_perc}*7)+(${sfty_perc}*-2)+(${pick6_perc}*-6) ;;


      html: {% if value < 1 %}
        <div style="color: black; background-color: #dc7350; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% elsif value < 3 %}
        <div style="color: black; background-color: #e9b404; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% else %}
        <div style="color: black; background-color: #49cec1; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% endif %}
      ;;
#     value_format_name: decimal_4
        value_format: "#.00"

      }
      measure: count {
        type: count
        drill_fields: [play_id, drive.drive_id, agg_play.count, play_player.count,description]
      }
    }
