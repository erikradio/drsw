class BiofileController < CatalogController
  configure_blacklight do |config|
    ## Class for sending and receiving requests from a search index
    # config.repository_class = Blacklight::Solr::Repository
    #
    ## Class for converting Blacklight's url parameters to into request parameters for the search index
    # config.search_builder_class = ::SearchBuilder
    #
    ## Model that maps search index responses to the blacklight response model
    # config.response_model = Blacklight::Solr::Response

    ## Default parameters to send to solr for all search-like requests. See also SearchBuilder#processed_parameters
    config.default_solr_params = {
      rows: 10
    }

    # solr path which will be added to solr base url before the other solr params.
    #config.solr_path = 'select'

    # items to show per page, each number in the array represent another option to choose from.
    #config.per_page = [10,20,50,100]

    ## Default parameters to send on single-document requests to Solr. These settings are the Blackligt defaults (see SearchHelper#solr_doc_params) or
    ## parameters included in the Blacklight-jetty document requestHandler.
    #
    #config.default_document_solr_params = {
    #  qt: 'document',
    #  ## These are hard-coded in the blacklight 'document' requestHandler
    #  # fl: '*',
    #  # rows: 1,
    #  # q: '{!term f=id v=$id}'
    #}

    #remove bookmarks
    # config.index.document_actions.delete(:all)
    # config.show.document_actions.delete(:all)
    # config.navbar.partials.delete(:all)

    #remove search history
    # config.index.document_actions.delete(:search_history)
    # config.show.document_actions.delete(:search_history)
    # config.navbar.partials.delete(:search_history)

    #remove sign in
    # config.index.document_actions.delete(:user)
    # config.show.document_actions.delete(:user)
    # config.navbar.partials.delete(:user/)

    # solr field configuration for search results/index views
    config.index.title_field = 'b_name_t'
    # config.index.display_type_field = 'format'
    #config.index.thumbnail_field = 'thumbnail_path_ss'


    # solr field configuration for document/show views
    config.show.title_field = 'b_name_t'
    #config.show.display_type_field = 'format'
    #config.show.thumbnail_field = 'thumbnail_path_ss'

    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.
    #
    # :show may be set to false if you don't want the facet to be drawn in the
    # facet bar
    #
    # set :index_range to true if you want the facet pagination view to have facet prefix-based navigation
    #  (useful when user clicks "more" on a large facet and wants to navigate alphabetically across a large set of results)
    # :index_range can be an array or range of prefixes that will be used to create the navigation (note: It is case sensitive when searching values)

    # config.add_facet_field 'format', label: 'Format'
    # config.add_facet_field 'pub_date', label: 'Publication Year', single: true
    # config.add_facet_field 'subject_topic_facet', label: 'ethnicity', limit: 20, index_range: 'A'..'Z'
    # config.add_facet_field 'language_facet', label: 'Language', limit: true
    # config.add_facet_field 'lc_1letter_facet', label: 'Call Number'
    # config.add_facet_field 'subject_geo_facet', label: 'Region'
    # config.add_facet_field 'subject_era_facet', label: 'Era'
    config.add_facet_field 'b_ethnicity_facet', label: 'Ethnicity'

    config.add_facet_field 'b_occupation_facet', label: 'Occupation'

    # config.add_facet_field 'person_facet', label: 'Person'
    # config.add_facet_field 'author', label: 'Author'
    # config.add_facet_field 'ethnic_group_facet', label: 'Ethnic Group'
    # config.add_facet_field 'military_group_facet', label: 'Military Group'
    # config.add_facet_field 'original_location_facet', label: 'Original Location'
    # config.add_facet_field 'example_pivot_field', label: 'Pivot Field', :pivot => ['format', 'language_facet']

    # config.add_facet_field 'example_query_facet_field', label: 'Publish Date', :query => {
    #    :years_5 => { label: 'within 5 Years', fq: "pub_date:[#{Time.zone.now.year - 5 } TO *]" },
    #    :years_10 => { label: 'within 10 Years', fq: "pub_date:[#{Time.zone.now.year - 10 } TO *]" },
    #    :years_25 => { label: 'within 25 Years', fq: "pub_date:[#{Time.zone.now.year - 25 } TO *]" }
    # }


    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    # config.add_index_field 'b_name_t', label: 'Name'
    config.add_index_field 'b_baptism_t', label: 'Baptism'
    config.add_index_field 'b_death_t', label: 'Death'
    config.add_index_field 'b_sources_t', label: 'Sources'
    config.add_index_field 'id', label: 'ID'
    config.add_index_field 'b_occupation_t', label: 'Occupation'
    # config.add_index_field 'original_location_t', label: 'Original Location'







    # config.add_index_field 'name_vern_display', label: 'name'
    # config.add_index_field 'author_display', label: 'Author'
    # config.add_index_field 'author_vern_display', label: 'Author'
    # config.add_index_field 'format', label: 'Format'
    # config.add_index_field 'language_facet', label: 'Language'
    # config.add_index_field 'published_display', label: 'Published'
    # config.add_index_field 'published_vern_display', label: 'Published'
    # config.add_index_field 'lc_callnum_display', label: 'Call number'

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display

    # config.add_show_field 'name_vern_display', label: 'name'
    # config.add_show_field 'subname_display', label: 'Subname'
    # config.add_show_field 'subname_vern_display', label: 'Subname'
    # config.add_show_field 'author_display', label: 'Author'
    # config.add_show_field 'author_vern_display', label: 'Author'
    # config.add_show_field 'format', label: 'Format'
    # config.add_show_field 'url_fulltext_display', label: 'URL'
    # config.add_show_field 'url_suppl_display', label: 'More Information'
    # config.add_show_field 'language_facet', label: 'Language'
    # config.add_show_field 'published_display', label: 'Published'
    # config.add_show_field 'published_vern_display', label: 'Published'
    # config.add_show_field 'lc_callnum_display', label: 'Call number'
    # config.add_show_field 'isbn_t', label: 'ISBN'
    config.add_show_field 'id', label: 'ID'
    config.add_show_field 'b_name_t', label: 'Name'

    config.add_show_field 'b_baptism_t', label: 'Baptism'
    config.add_show_field 'b_death_t', label: 'Death'

    config.add_show_field 'b_familty_t', label: 'Family'

    config.add_show_field 'b_occupation_t', label: 'Occupation'
    config.add_show_field 'b_ethnicity_t', label: 'Ethnicity'
    config.add_show_field 'b_first_marriage_t', label: 'First Marriage'
    config.add_show_field 'b_second_marriage_t', label: 'Second Marriage'
    config.add_show_field 'b_third_marriage_t', label: 'Third Marriage'
    config.add_show_field 'b_other_t', label: 'Other Information'
    config.add_show_field 'b_residents_t', label: 'Residents'
    config.add_show_field 'b_unresidents_t', label: 'Undocumented Residents'

    config.add_show_field 'b_unfamily_t', label: 'Undocumented Family'



    config.add_show_field 'b_confirmation_t', label: 'Confirmation'
    config.add_show_field 'b_sources_t', label: 'Sources'
    config.add_show_field 'b_seeAlso_t', label: 'See Also'
    config.add_show_field 'b_notes_t', label: 'Notes'





    # "fielded" search configuration. Used by pulldown among other b_occupations.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.

    config.add_search_field 'all_fields', label: 'All Fields'




    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields.

    config.add_search_field('b_name',label:'Name') do |field|
      # solr_parameters hash are sent to Solr as ordinary url query params.
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_name' }

      # :solr_local_parameters will be sent using Solr LocalParams
      # syntax, as eg {! qf=$name_qf }. This is neccesary to use
      # Solr parameter de-referencing like $name_qf.
      # See: http://wiki.apache.org/solr/LocalParams
      field.solr_local_parameters = {
        qf: '$b_name_qf',
        pf: '$b_name_pf'
      }
    end

    config.add_search_field('b_baptism', label:'Baptism') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_baptism' }
      field.solr_local_parameters = {
        qf: '$b_baptism_qf',
        pf: '$b_baptism_pf'
      }
    end

    config.add_search_field('b_confirmation', label: 'Confirmation') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_confirmation' }
      field.solr_local_parameters = {
        qf: '$b_confirmation_qf',
        pf: '$b_confirmation_pf'
      }
    end

    config.add_search_field('b_death', label: 'Death') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_death' }
      field.solr_local_parameters = {
        qf: '$b_death_qf',
        pf: '$b_death_pf'
      }
    end





    config.add_search_field('b_first_marriage',label:'First Marriage') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_first_marriage' }
      field.solr_local_parameters = {
        qf: '$b_first_marriage_qf',
        pf: '$b_first_marriage_pf'
      }
    end



    config.add_search_field('b_second_marriage',label:'Second Marriage') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_second_marriage' }
      field.solr_local_parameters = {
        qf: '$b_second_marriage_qf',
        pf: '$b_second_marriage_pf'
      }
    end

    config.add_search_field('b_third_marriage', label: 'Third Marriage') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_third_marriage' }
      field.solr_local_parameters = {
        qf: '$b_third_marriage_qf',
        pf: '$b_third_marriage_pf'
      }
    end

    config.add_search_field('b_notes',label:'Notes') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_notes' }
      field.solr_local_parameters = {
        qf: '$b_notes_qf',
        pf: '$b_notes_pf'
      }
    end

    config.add_search_field('b_ethnicity', label: 'Ethnicity') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_ethnicity' }
      field.solr_local_parameters = {
        qf: '$b_ethnicity_qf',
        pf: '$b_ethnicity_pf'
      }
    end

    config.add_search_field('b_other', label:'Other Information') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_other' }
      field.solr_local_parameters = {
        qf: '$b_other_qf',
        pf: '$b_other_pf'
      }
  end

  config.add_search_field('b_residents', label:'Residents') do |field|
    field.solr_parameters = { :'spellcheck.dictionary' => 'b_residents' }
    field.solr_local_parameters = {
      qf: '$b_residents_qf',
      pf: '$b_residents_pf'
    }
end

    config.add_search_field('b_family', label: 'Family') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_family' }
      field.solr_local_parameters = {
        qf: '$b_family_qf',
        pf: '$b_family_pf'
      }
    end

      config.add_search_field('b_occupation',label:'Occupation') do |field|
        field.solr_parameters = { :'spellcheck.dictionary' => 'b_occupation' }
        field.solr_local_parameters = {
          qf: '$b_occupation_qf',
          pf: '$b_occupation_pf'
        }
      end



    config.add_search_field('b_sources', label: 'Sources') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_sources' }
      field.solr_local_parameters = {
        qf: '$b_sources_qf',
        pf: '$b_sources_pf'
      }
    end

    config.add_search_field('b_unresidents', label: 'Undocument Residents') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_unresidents' }
      field.solr_local_parameters = {
        qf: '$b_unresidents_qf',
        pf: '$b_unresidents_pf'
      }
    end

    config.add_search_field('b_unfamily', label: 'Undocumented Family') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'b_unfamily' }
      field.solr_local_parameters = {
        qf: '$b_unfamily_qf',
        pf: '$b_unfamily_pf'
      }
    end

    config.add_search_field('id', label:'ID') do |field|

      field.solr_local_parameters = {
        qf: '$id_qf',
        pf: '$id_pf'
      }
    end

    # config.add_search_field '____', label: ' '
    # config.add_search_field '_____', label: '-Biofile-'


    # Specifying a :qt only to show it's possible, and so our internal automated
    # tests can test it. In this case it's the same as
    # config[:default_solr_parameters][:qt], so isn't actually neccesary.
    # config.add_search_field('subject') do |field|
    #   field.solr_parameters = { :'spellcheck.dictionary' => 'subject' }
    #   field.qt = 'search'
    #   field.solr_local_parameters = {
    #     qf: '$subject_qf',
    #     pf: '$subject_pf'
    #   }
    # end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    # config.add_sort_field 'score desc, pub_date_sort desc, name_sort asc', label: 'relevance'
    # config.add_sort_field 'pub_date_sort desc, name_sort asc', label: 'year'
    # config.add_sort_field 'author_sort asc, name_sort asc', label: 'author'
    # config.add_sort_field 'name_sort asc, pub_date_sort desc', label: 'name'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5

    # Configuration for autocomplete suggestor
    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'
  end
end
