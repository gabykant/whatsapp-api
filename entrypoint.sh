#!/bin/bash

# Attendre que la DB soit prête
echo "⏳ Attente de la base de données..."
until mysql -h db -u root -proot -e "SELECT 1" > /dev/null 2>&1; do
  sleep 2
done
echo "✅ Base de données disponible."

# Lancer les commandes Laravel
php artisan migrate --force
# php artisan db:seed --force

# Importer un fichier SQL personnalisé (optionnel)
if [ -f "./database/init.sql" ]; then
  echo "📥 Import du fichier SQL personnalisé..."
  mysql -h db -u root -proot automatesale < ./database/init.sql
fi

# Lancer le serveur
php artisan serve --host=0.0.0.0 --port=8000
