view: quantit_by_quarter {
  derived_table: {
    sql: SELECT
      EXTRACT(YEAR FROM (TO_DATE(commandes."Date de commande",'dd/mm/yyyy' )) )::integer AS "commandes.dimensiondate_year",


      decode(TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', TO_DATE(commandes."Date de commande" ,'dd/mm/yyyy') )), 'MM'),'01','Q1','04','Q2','07','Q3','Q4') AS "commandes.created_quarter",



      sum(commandes."Quantité") AS "commandes.quantit"

      FROM PUBLIC.COMMANDES  AS commandes, PUBLIC.COMMANDES AS commandes1

      Group by 1,2
      order by 1,2 asc
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

  dimension: commandes_created_quarter {
    type: string
    sql: ${TABLE}."commandes.created_quarter" ;;
  }

  dimension: commandes_quantit {
    type: number
    sql: ${TABLE}."commandes.quantit" ;;
  }

  set: detail {
    fields: [commandes_dimensiondate_year, commandes_created_quarter, commandes_quantit]
  }
}
