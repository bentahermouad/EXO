view: sql_runner_query_3 {
  derived_table: {
    sql: WITH sql_runner_query_2 AS (SELECT



            Concat(EXTRACT(YEAR FROM (TO_DATE(commandes."Date de commande",'dd/mm/yyyy' )) ), ' ' ,


            decode(TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', TO_DATE(commandes."Date de commande" ,'dd/mm/yyyy') )), 'MM'),'01','Q1','04','Q2','07','Q3','Q4') ) AS Quarter,
            sum(commandes."Quantité") AS "commandes.quantit"



            FROM PUBLIC.COMMANDES  AS commandes

      group by 1
      order by 1 asc


             )
      SELECT
        sql_runner_query_2."QUARTER"  AS "sql_runner_query_2.quarter",
        sum( sql_runner_query_2."commandes.quantit" ) AS "sql_runner_query_2.commandes_quantit"
      FROM sql_runner_query_2

      GROUP BY 1
      ORDER BY 1 asc
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sql_runner_query_2_quarter {
    type: string
    sql: ${TABLE}."sql_runner_query_2.quarter" ;;
  }

  dimension: sql_runner_query_2_commandes_quantit {
    type: number
    sql: ${TABLE}."sql_runner_query_2.commandes_quantit" ;;
  }

  set: detail {
    fields: [sql_runner_query_2_quarter, sql_runner_query_2_commandes_quantit]
  }
}
