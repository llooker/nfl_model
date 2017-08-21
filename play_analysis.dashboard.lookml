- dashboard: play_analysis_dashboard
  title: Play Analysis Dashboard
  layout: newspaper
  elements:
  - name: Pass Play Types Count
    title: Pass Play Types Count
    model: nfl
    explore: play_player
    type: looker_column
    fields:
    - play.pass_play_type
    - play.count
    - play.expected_points
    - play_player.average_passing_yards
    filters:
      play.pass_play_type: "-NULL"
    sorts:
    - play.count desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types:
      play.expected_points: line
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    y_axis_orientation:
    - left
    - right
    - left
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 4
    col: 0
    width: 12
    height: 8
  - name: Run Play Types Count
    title: Run Play Types Count
    model: nfl
    explore: play_player
    type: looker_bar
    fields:
    - play.count
    - play.run_play_type
    - play.expected_points
    - play_player.average_rushing_yards
    filters:
      play.run_play_type: "-NULL"
      play_player.team: ''
      game.season_year: ''
    sorts:
    - play.count desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: false
    show_y_axis_labels: false
    show_y_axis_ticks: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types:
      play.expected_points: line
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    y_axis_orientation:
    - left
    - right
    - left
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 4
    col: 12
    width: 12
    height: 8
  - name: Formation By Down Count
    title: Formation By Down Count
    model: nfl
    explore: play_player
    type: table
    fields:
    - play.count
    - play.formation
    - play.down
    pivots:
    - play.down
    filters:
      play.down: NOT NULL
    sorts:
    - play.count desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 25
    col: 0
    width: 9
    height: 4
  - name: Average Yards Rush/Pass By Formation and Down
    title: Average Yards Rush/Pass By Formation and Down
    model: nfl
    explore: play_player
    type: table
    fields:
    - play.down
    - play.formation
    - play_player.average_rushing_yards
    - play_player.average_passing_yards
    pivots:
    - play.down
    filters:
      play.down: NOT NULL
      play.formation: "-Punt,-Field Goal"
    sorts:
    - play_player.average_rushing_yards desc 0
    - play.down
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    enable_conditional_formatting: true
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
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 12
    col: 0
    width: 12
    height: 5
  - name: Average Yards by Rush Direction and Down
    title: Average Yards by Rush Direction and Down
    model: nfl
    explore: play_player
    type: table
    fields:
    - play.run_play_type
    - play_player.average_rushing_yards
    - play.down
    pivots:
    - play.down
    filters:
      play.down: NOT NULL
      play.run_play_type: "-NULL"
    sorts:
    - play_player.average_rushing_yards desc 0
    - play.down
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    enable_conditional_formatting: true
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
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 12
    col: 12
    width: 12
    height: 5
  - name: Yards by Pass Play type and Week
    title: Yards by Pass Play type and Week
    model: nfl
    explore: play_player
    type: looker_line
    fields:
    - game.week
    - play_player.total_passing_yds
    - play.pass_play_type
    pivots:
    - play.pass_play_type
    filters:
      game.season_type: Regular
      play.pass_play_type: "-NULL"
    sorts:
    - game.week
    - play.pass_play_type
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 17
    col: 0
    width: 12
    height: 8
  - name: Logo
    title: Logo
    model: nfl
    explore: team
    type: single_value
    fields:
    - team.logo
    filters:
      team.team_id: ''
    sorts:
    - team.logo
    limit: 1
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    series_types: {}
    listen:
      Team: team.team_id
    row: 0
    col: 6
    width: 4
    height: 2
  - name: 3rd Down Conversion %
    title: 3rd Down Conversion %
    model: nfl
    explore: play_player
    type: single_value
    fields:
    - play.first_down_conv_perc
    filters:
      play.down: '3'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    series_types: {}
    value_format: 0.00%
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 0
    col: 14
    width: 4
    height: 2
  - name: Yards by Rush Direction and Week
    title: Yards by Rush Direction and Week
    model: nfl
    explore: play_player
    type: looker_line
    fields:
    - game.week
    - play.run_play_type
    - play_player.total_rushing_yds
    pivots:
    - play.run_play_type
    filters:
      game.season_type: Regular
      play.run_play_type: "-NULL"
    sorts:
    - game.week
    - play.run_play_type
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 17
    col: 12
    width: 12
    height: 8
  - name: Sum Rushing Fumbles
    title: Sum Rushing Fumbles
    model: nfl
    explore: play_player
    type: single_value
    fields:
    - play_player.total_rushing_fumbles
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#dc7350"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 0
    col: 18
    width: 4
    height: 2
  - name: Sum Interceptions
    title: Sum Interceptions
    model: nfl
    explore: play_player
    type: single_value
    fields:
    - play_player.total_passing_ints
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#dc7350"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 0
    col: 10
    width: 4
    height: 2
  - name: Pass
    type: text
    title_text: Pass
    row: 2
    col: 0
    width: 12
    height: 2
  - name: Run
    type: text
    title_text: Run
    row: 2
    col: 12
    width: 12
    height: 2
  - name: Overview
    type: text
    title_text: Overview
    row: 0
    col: 0
    width: 6
    height: 2
  filters:
  - name: Team
    title: Team
    type: field_filter
    default_value: ''
    model: nfl
    explore: play_player
    field: play_player.team
    listens_to_filters: []
    allow_multiple_values: true
  - name: Year
    title: Year
    type: field_filter
    default_value: ''
    model: nfl
    explore: game
    field: game.season_year
    listens_to_filters: []
    allow_multiple_values: true
