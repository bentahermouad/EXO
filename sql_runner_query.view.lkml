view: sql_runner_query {
  derived_table: {
    sql: SELECT
        EXTRACT(YEAR FROM (TO_DATE(commandes."Date de commande",'dd/mm/yyyy' )) )::integer AS "commandes.dimensiondate_year",
        EXTRACT (Quarter FROM (TO_DATE(commandes."Date de commande",'dd/mm/yyyy'))) AS "commandes.dimensiondate_quarter",
        sum(commandes."Quantité") AS "commandes.quantit"
      FROM PUBLIC.COMMANDES  AS commandes

      GROUP BY 1,2
      ORDER BY 1 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: commandes_dimensiondate_year {
    type: number
    sql: ${TABLE}."commandes.dimensiondate_year" ;;
  }

  dimension: commandes_dimensiondate_quarter {
    type: number
    sql: ${TABLE}."commandes.dimensiondate_quarter" ;;
  }

  dimension: commandes_quantit {
    type: number
    sql: ${TABLE}."commandes.quantit" ;;
  }

  set: detail {
    fields: [commandes_dimensiondate_year, commandes_dimensiondate_quarter, commandes_quantit]
  }
}
