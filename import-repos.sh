#!/bin/bash

cd /e/GitHub/courses/goit-markup

declare -A repos=(
  ["01-html"]="https://github.com/brzozanet/goit-markup-hw-01.git"
  ["02-css"]="https://github.com/brzozanet/goit-markup-hw-02.git"
  ["03-flexbox"]="https://github.com/brzozanet/goit-markup-hw-03.git"
  ["04-images"]="https://github.com/brzozanet/goit-markup-hw-04.git"
  ["05-display-transform"]="https://github.com/brzozanet/goit-markup-hw-05.git"
  ["06-form"]="https://github.com/brzozanet/goit-markup-hw-06.git"
  ["07-bem-sass"]="https://github.com/brzozanet/goit-markup-hw-07.git"
)

for prefix in "${!repos[@]}"; do
  alias_name="gm${prefix//./-}"

  echo "🔄 Importuję $prefix z ${repos[$prefix]}"
  git remote add "$alias_name" "${repos[$prefix]}"
  git fetch "$alias_name"

  echo "📁 Dodaję do folderu: $prefix"
  git subtree add --prefix="$prefix" "$alias_name" main

  echo "🧹 Usuwam remote: $alias_name"
  git remote remove "$alias_name"

  echo "✅ Gotowe: $prefix"
  echo "----------------------------------------"
done

echo "🚀 Wszystkie repozytoria zostały dodane!"
