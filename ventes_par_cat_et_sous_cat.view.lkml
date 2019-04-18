view: ventes_par_cat_et_sous_cat {
  derived_table: {
    sql: SELECT
        commandes."Catégorie"
           AS "commandes.catgorie",
        commandes."Sous-catégorie"  AS "commandes.souscatgorie",
        sum(commandes."VENTES")  AS "commandes.ventes"
      FROM PUBLIC.COMMANDES  AS commandes

      GROUP BY 1,2
      order by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: commandes_catgorie {
    type: string
    sql: ${TABLE}."commandes.catgorie" ;;
  }

  dimension: commandes_souscatgorie {
    type: string
    sql: ${TABLE}."commandes.souscatgorie" ;;
  }

  measure: commandes_ventes {
    type: number
    sql: ${TABLE}."commandes.ventes" ;;
  }

  set: detail {
    fields: [commandes_catgorie, commandes_souscatgorie, commandes_ventes]
  }
}
