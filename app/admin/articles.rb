ActiveAdmin.register Article do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :image, category_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :body, as: :medium_editor, input_html: { data: { options: '{"spellcheck":false,"toolbar":{"buttons":["bold","italic","underline","anchor","removeFormat","indent","outdent"]}}' } }
      f.input :image, as: :file
      f.input :categories
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :body do |article|
        article.body.html_safe
      end
      row :image do |article|
        image_tag article.image
      end
    end
    # active_admin_comments
  end
end
