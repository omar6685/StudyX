class TaxonsTreeComponent < ViewComponent::Base
  attr_reader :root_taxon, :title, :current_taxon, :max_level, :base_class

  def initialize(
    root_taxon:,
    title: nil,
    current_taxon: nil,
    max_level: 1,
    base_class: nil
  )
    @root_taxon = root_taxon
    @title = title
    @current_taxon = current_taxon
    @max_level = max_level
    @base_class = base_class
  end

  def call
    safe_join([header_tag, taxons_list].compact) if taxons_list
  end

  private

  def taxons_list
    @taxons_list ||= tree(root_taxon: root_taxon, base_class: "#{base_class}__list", max_level: max_level)
  end

  def header_tag
    content_tag(:h6, title, class: "#{base_class}__title") if title
  end

  def tree(root_taxon:, base_class:, max_level:)
    return  if max_level < 1 || root_taxon.children.empty?
  
    content_tag :div, class: "container semi-transparent-un reveal", id: 'un' do
      taxons = root_taxon.children.map do |taxon|
        css_class = 'current' if current_taxon&.self_and_ancestors&.include?(taxon)
  
        content_tag :div, class: 'a-edit hover' do
          link_to(helpers.taxon_seo_url(taxon), class: '') do
            content_tag(:div, class: 'inherit') do
              content_tag(:div, class: 'box-d-3-un') do
              end +
              content_tag(:div, class: 'box-d-2-un grid') do
                content_tag(:span, taxon.name, class: 'text-un-1') +
                content_tag(:span, 'read more', class: 'text-un-2')
              end +
              (taxon.icon.attached? ? content_tag(:div, class: '') do
                image_tag(taxon.icon.url, class: 'image-d-un', alt: '')
              end : '')
            end
          end +
          tree(root_taxon: taxon, base_class: nil, max_level: max_level - 1)
        end
      end
  
      safe_join(taxons, "\n")
    end
  end
  
  
end
