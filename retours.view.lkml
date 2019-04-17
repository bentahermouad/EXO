view: retours {
  sql_table_name: PUBLIC.RETOURS ;;

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."Order ID" ;;
  }

  dimension: returned {
    type: string
    sql: ${TABLE}."RETURNED" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
