connection: "commandesexo"

# include all the views
include: "*.view"

datagroup: exo_commandes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: exo_commandes_default_datagroup



explore: commandes {}

explore: personnes {}

explore: retours {}
