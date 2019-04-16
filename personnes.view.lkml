view: personnes {
  sql_table_name: PUBLIC.PERSONNES ;;

  dimension: people {
    type: string
    sql: ${TABLE}."PEOPLE" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
