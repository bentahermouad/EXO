view: commandes {
  sql_table_name: PUBLIC.COMMANDES ;;

  dimension: bnfices {
    type: string
    sql: ${TABLE}."Bénéfices" ;;
  }

  dimension: catgorie {
    type: string
    sql: ${TABLE}."Catégorie" ;;
  }

  dimension: client__nom {
    type: string
    sql: ${TABLE}."Client - Nom" ;;
  }

  dimension: client__numro {
    type: string
    sql: ${TABLE}."Client - Numéro" ;;
  }

  dimension: client__segment {
    type: string
    sql: ${TABLE}."Client - Segment" ;;
  }

  dimension: client__zone_gographique {
    type: string
    sql: ${TABLE}."Client - Zone géographique" ;;
  }

  dimension: date_de_commande {
    type: string
    sql: ${TABLE}."Date de commande" ;;
  }

  dimension: date_dexpdition {
    type: string
    sql: ${TABLE}."Date d'expédition" ;;
  }

  dimension: id_commande {
    type: string
    sql: ${TABLE}."ID commande" ;;
  }

  dimension: id_ligne {
    type: string
    sql: ${TABLE}."ID ligne" ;;
  }

  dimension: mode_dexpdition {
    type: string
    sql: ${TABLE}."Mode d'expédition" ;;
  }

  dimension: pays {
    type: string
    sql: ${TABLE}."PAYS" ;;
  }

  dimension: produit__nom {
    type: string
    sql: ${TABLE}."Produit - Nom" ;;
  }

  dimension: produit__numro {
    type: string
    sql: ${TABLE}."Produit - Numéro" ;;
  }

  dimension: quantit {
    type: string
    sql: ${TABLE}."Quantité" ;;
  }

  dimension: remise {
    type: string
    sql: ${TABLE}."REMISE" ;;
  }

  dimension: remise8 {
    type: string
    sql: ${TABLE}."REMISE8" ;;
  }

  dimension: rgionprovince {
    type: string
    sql: ${TABLE}."Région/Province" ;;
  }

  dimension: souscatgorie {
    type: string
    sql: ${TABLE}."Sous-catégorie" ;;
  }

  dimension: ventes {
    type: string
    sql: ${TABLE}."VENTES" ;;
  }

  dimension: ville {
    type: string
    sql: ${TABLE}."VILLE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}