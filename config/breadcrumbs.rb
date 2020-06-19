# ルート
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :mypage do |user|
  link "マイページ", user_path(user.id)
end

crumb :logout do |user|
  link "ログアウト", logout_users_path
  parent :mypage ,user
end

# カテゴリー
crumb :categories do |category|
  link "カテゴリー 一覧", categories_path
end

crumb :category do |category|
  link "#{category.name}", category_path(category.id)
  parent :categories ,category

end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).