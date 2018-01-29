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
    config.index.title_field = 'name_t'
    # config.index.display_type_field = 'format'
    #config.index.thumbnail_field = 'thumbnail_path_ss'


    # solr field configuration for document/show views
    config.show.title_field = 'name_t'
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
    config.add_facet_field 'ethnicity_facet', label: 'Ethnicity'

    config.add_facet_field 'occupation_facet', label: 'Occupation'

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
    config.add_index_field 'name_t', label: 'Name'
    config.add_index_field 'baptism_t', label: 'Baptism'
    config.add_index_field 'death_t', label: 'Death'
    config.add_index_field 'sources_t', label: 'Sources'
    config.add_index_field 'id', label: 'ID'
    config.add_index_field 'occupation_t', label: 'Occupation'
    # config.add_index_field 'original_location_t', label: 'Original Location'








    # config.add_show_field 'isbn_t', label: 'ISBN'
    config.add_show_field 'id', label: 'ID'
    config.add_show_field 'name_t', label: 'Name'

    config.add_show_field 'baptism_t', label: 'Baptism'
    config.add_show_field 'death_t', label: 'Death'

    config.add_show_field 'familty_t', label: 'Family'

    config.add_show_field 'occupation_t', label: 'Occupation'
    config.add_show_field 'ethnicity_t', label: 'Ethnicity'
    config.add_show_field 'first_marriage_t', label: 'First Marriage'
    config.add_show_field 'second_marriage_t', label: 'Second Marriage'
    config.add_show_field 'third_marriage_t', label: 'Third Marriage'
    config.add_show_field 'other_t', label: 'Other Information'
    config.add_show_field 'residents_t', label: 'Residents'
    config.add_show_field 'unresidents_t', label: 'Undocumented Residents'

    config.add_show_field 'unfamily_t', label: 'Undocumented Family'



    config.add_show_field 'confirmation_t', label: 'Confirmation'
    config.add_show_field 'sources_t', label: 'Sources'
    config.add_show_field 'seeAlso_t', label: 'See Also'
    config.add_show_field 'notes_t', label: 'Notes'





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

    config.add_search_field('name',label:'Name') do |field|
      # solr_parameters hash are sent to Solr as ordinary url query params.
      field.solr_parameters = { :'spellcheck.dictionary' => 'name' }

      # :solr_local_parameters will be sent using Solr LocalParams
      # syntax, as eg {! qf=$name_qf }. This is neccesary to use
      # Solr parameter de-referencing like $name_qf.
      # See: http://wiki.apache.org/solr/LocalParams
      field.solr_local_parameters = {
        qf: '$name_qf',
        pf: '$name_pf'
      }
    end

    config.add_search_field('baptism', label:'Baptism') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'baptism' }
      field.solr_local_parameters = {
        qf: '$baptism_qf',
        pf: '$baptism_pf'
      }
    end

    config.add_search_field('confirmation', label: 'Confirmation') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'confirmation' }
      field.solr_local_parameters = {
        qf: '$confirmation_qf',
        pf: '$confirmation_pf'
      }
    end

    config.add_search_field('death', label: 'Death') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'death' }
      field.solr_local_parameters = {
        qf: '$death_qf',
        pf: '$death_pf'
      }
    end





    config.add_search_field('first_marriage',label:'First Marriage') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'first_marriage' }
      field.solr_local_parameters = {
        qf: '$first_marriage_qf',
        pf: '$first_marriage_pf'
      }
    end



    config.add_search_field('second_marriage',label:'Second Marriage') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'second_marriage' }
      field.solr_local_parameters = {
        qf: '$second_marriage_qf',
        pf: '$second_marriage_pf'
      }
    end

    config.add_search_field('third_marriage', label: 'Third Marriage') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'third_marriage' }
      field.solr_local_parameters = {
        qf: '$third_marriage_qf',
        pf: '$third_marriage_pf'
      }
    end

    config.add_search_field('notes',label:'Notes') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'notes' }
      field.solr_local_parameters = {
        qf: '$notes_qf',
        pf: '$notes_pf'
      }
    end

    config.add_search_field('ethnicity', label: 'Ethnicity') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'ethnicity' }
      field.solr_local_parameters = {
        qf: '$ethnicity_qf',
        pf: '$ethnicity_pf'
      }
    end

    config.add_search_field('other', label:'Other Information') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'other' }
      field.solr_local_parameters = {
        qf: '$other_qf',
        pf: '$other_pf'
      }
  end

  config.add_search_field('residents', label:'Residents') do |field|
    field.solr_parameters = { :'spellcheck.dictionary' => 'residents' }
    field.solr_local_parameters = {
      qf: '$residents_qf',
      pf: '$residents_pf'
    }
end

    config.add_search_field('family', label: 'Family') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'family' }
      field.solr_local_parameters = {
        qf: '$family_qf',
        pf: '$family_pf'
      }
    end

      config.add_search_field('occupation',label:'Occupation') do |field|
        field.solr_parameters = { :'spellcheck.dictionary' => 'occupation' }
        field.solr_local_parameters = {
          qf: '$occupation_qf',
          pf: '$occupation_pf'
        }
      end



    config.add_search_field('sources', label: 'Sources') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'sources' }
      field.solr_local_parameters = {
        qf: '$sources_qf',
        pf: '$sources_pf'
      }
    end

    config.add_search_field('unresidents', label: 'Undocument Residents') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'unresidents' }
      field.solr_local_parameters = {
        qf: '$unresidents_qf',
        pf: '$unresidents_pf'
      }
    end

    config.add_search_field('unfamily', label: 'Undocumented Family') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'unfamily' }
      field.solr_local_parameters = {
        qf: '$unfamily_qf',
        pf: '$unfamily_pf'
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
