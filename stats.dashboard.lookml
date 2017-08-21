- dashboard: nfl_teams
  title: NFL Teams
  layout: newspaper
  embed_style:
    background_color: "#000000"
    show_title: true
    title_color: "#3196bd"
    show_filters_bar: true
    tile_text_color: "#5b7782"
    text_tile_text_color: ''
  elements:
  - name: Pass/Run YoY
    title: Pass/Run YoY
    model: nfl
    explore: play_player
    type: looker_bar
    fields:
    - play_player.total_passing_att
    - play_player.total_rushing_att
    - game.start_year
    filters:
      play.is_active_play: 'Yes'
      play_player.team: ''
    sorts:
    - play_player.total_passing_att desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: percent
    show_value_labels: false
    label_density: 12
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    value_labels: legend
    label_type: labPer
    series_types: {}
    x_axis_reversed: false
    y_axis_unpin: true
    y_axis_min:
    - ".530"
    y_axis_max:
    - ".590"
    row: 8
    col: 0
    width: 7
    height: 7
  - name: Year Penalties
    title: Year Penalties
    model: nfl
    explore: play_player
    type: looker_column
    fields:
    - play.penalty_type
    - play.sum_penalty_yds
    sorts:
    - play.sum_penalty_yds desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      play.sum_penalty_yds: "#d4627d"
    listen:
      Is Active Play: play.is_active_play
    row: 8
    col: 7
    width: 7
    height: 7
  - name: Team TD % Yardage
    title: Team TD % Yardage
    model: nfl
    explore: play_player
    type: looker_area
    fields:
    - play.is_touchdown
    - play.yardlines
    - play.count
    pivots:
    - play.is_touchdown
    fill_fields:
    - play.is_touchdown
    filters:
      game.season_year: ''
      play.is_active_play: 'Yes'
      play.is_extra_point: 'No'
      play.pos_team: ''
      play.yardlines: ">0"
    sorts:
    - play.yardlines desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    series_types: {}
    y_axis_reversed: true
    x_axis_reversed: false

    row: 15
    col: 0
    width: 24
    height: 8
  - name: Team % First Down Conv by Down
    title: Team % First Down Conv by Down
    model: nfl
    explore: play_player
    type: looker_column
    fields:
    - play.down
    - play.yards_to_go
    - play.first_down_conv_perc
    pivots:
    - play.down
    filters:
      play.down: NOT NULL
    sorts:
    - play.yards_to_go
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Is Active Play: play.is_active_play
    row: 23
    col: 0
    width: 24
    height: 8
  - name: Expected Points All Years By Down (incl FG)
    title: Expected Points All Years By Down (incl FG)
    model: nfl
    explore: play_player
    type: looker_line
    fields:
    - drive.expected_points_drive
    - play.yardlines
    - play.down
    pivots:
    - play.down
    filters:
      play.down: NOT NULL
      play.yardlines: ">=0"
    sorts:
    - play.yardlines desc
    - play.down
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    reference_lines: []
    listen:
      Is Active Play: play.is_active_play
    row: 0
    col: 14
    width: 10
    height: 8
  - name: Top Rusher Summary
    title: Top Rusher Summary
    model: nfl
    explore: play_player
    type: looker_single_record
    fields:
    - player.portrait
    - player.full_name
    - player.uniform_number
    - play_player.total_rushing_tds
    - play_player.total_rushing_yds
    - play_player.total_rushing_fumbles
    - play_player.total_rushing_att
    - play_player.total_receiving_tds
    - play_player.total_receiving_rec
    filters:
      game.season_year: '2015'
    sorts:
    - play_player.total_rushing_yds desc
    limit: 1
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
    row: 0
    col: 0
    width: 7
    height: 8
  - name: Top Passer Summary
    title: Top Passer Summary
    model: nfl
    explore: play_player
    type: looker_single_record
    fields:
    - player.portrait
    - player.full_name
    - player.uniform_number
    - play_player.total_passing_yds
    - play_player.total_passing_tds
    - play_player.total_passing_ints
    - play_player.total_passing_comp
    - play_player.total_passing_att
    - play_player.total_rushing_att
    - play_player.total_rushing_yds
    - play_player.total_rushing_tds
    filters:
      game.season_year: '2015'
    sorts:
    - play_player.total_passing_yds desc
    limit: 1
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
    row: 0
    col: 7
    width: 7
    height: 8
  - name: Expected Points Matrix
    title: Expected Points Matrix
    model: nfl
    explore: play_player
    type: table
    fields:
    - drive.expected_points_drive
    - play.state
    - play.yardlines
    pivots:
    - play.state
    sorts:
    - play.state
    - play.yardlines desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: monotone
    series_types: {}
    reference_lines: []
    listen:
      Team: play_player.team
    row: 31
    col: 0
    width: 24
    height: 8
  - name: Expected Points from Current Drive by Yardage
    title: Expected Points from Current Drive by Yardage
    model: nfl
    explore: play_player
    type: looker_line
    fields:
    - drive.expected_points_drive
    - play.yardlines
    sorts:
    - play.yardlines desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 8
    col: 14
    width: 10
    height: 7
  - name: Team vs Team Win / Loss ratio
    title: Team vs Team Win / Loss ratio
    model: nfl
    explore: home_team
    type: table
    fields:
    - home_team.home_vs_away
    - home_team.home_team
    - away_team.away_team
    pivots:
    - away_team.away_team
    filters:
      home_team.home_team: ''
    sorts:
    - away_team.away_team 0
    - home_team.home_team
    limit: 500
    column_limit: 50
    query_timezone: Europe/Dublin
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    row:
    col:
    width:
    height:
  filters:
  - name: Team
    title: Team
    type: field_filter
    default_value: SD
    model: nfl
    explore: play_player
    field: player.team
    listens_to_filters: []
    allow_multiple_values: true
  - name: Is Active Play
    title: Is Active Play
    type: field_filter
    default_value: 'Yes'
    model: nfl
    explore: play
    field: play.is_active_play
    listens_to_filters: []
    allow_multiple_values: true
  - name: Year
    title: Year
    type: field_filter
    default_value: '2015'
    model: nfl
    explore: play_player
    field: game.season_year
    listens_to_filters: []
    allow_multiple_values: true
