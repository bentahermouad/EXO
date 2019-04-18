view: final_qt_by_quarter {
  derived_table: {
    sql: SELECT
      Concat(EXTRACT(YEAR FROM (TO_DATE(commandes."Date de commande",'dd/mm/yyyy' )) ), ' ' ,


      decode(TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', TO_DATE(commandes."Date de commande" ,'dd/mm/yyyy') )), 'MM'),'01','Q1','04','Q2','07','Q3','Q4') ) AS Quarter,



      sum(commandes."Quantité") AS "commandes.quantit"

      FROM PUBLIC.COMMANDES  AS commandes

      Group by 1
      order by 1,2 asc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: commandes_quantit {
    type: number
    sql: ${TABLE}."commandes.quantit" ;;
  }

  set: detail {
    fields: [quarter, commandes_quantit]
  }
}
