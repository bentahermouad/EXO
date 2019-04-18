view: sql_runner_query_2 {
  derived_table: {
    sql: SELECT



      Concat(EXTRACT(YEAR FROM (TO_DATE(commandes."Date de commande",'dd/mm/yyyy' )) ), ' ' ,


      decode(TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', TO_DATE(commandes."Date de commande" ,'dd/mm/yyyy') )), 'MM'),'01','Q1','04','Q2','07','Q3','Q4') ) AS Quarter,
      sum(commandes."Quantité") AS "commandes.quantit"





      FROM PUBLIC.COMMANDES  AS commandes
      group by 2
      order by 2

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: commandes_quantit {
    type: number
    sql: ${TABLE}."commandes.quantit" ;;
  }

  measure: quarter {
    type: string
    sql: ${TABLE}."QUARTER" ;;
  }

  set: detail {
    fields: [commandes_quantit, quarter]
  }
}
