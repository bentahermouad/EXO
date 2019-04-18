connection: "commandesexo"

# include all the views
include: "*.view"

datagroup: exo_commandes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: exo_commandes_default_datagroup



explore: commandes {
  join: retours {
    foreign_key:id_commande
    }
}

explore: personnes {}

explore: retours {}
explore: quantit_by_quarter {}
explore: concat_quantity_by_quarter {}
explore: sql_runner_query_2 {}
explore: sql_runner_query_3{}
explore: final_qt_by_quarter {}
explore: ventes_par_cat_et_sous_cat {}
