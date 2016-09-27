class SearchController < ApplicationController
 
   def get_results
    @category = params[:category] if params[:category]
    @tag = params[:tag] if params[:tag]
   
    if @tag.nil?
      # category andtag search 
      @listings = Listing.where("tags like ?", "%#{@category}%").order("updated_at DESC")
    else
      @listings_in_category = Listing.where("tags like ?", "%#{@category}%").order("updated_at DESC")

      @listings = []
      @listings_in_category.each do |list|
        if list.tags && list.tags.include?(@tag)
          @listings << list
        end
      end
      # category only search
    end

    # response block
    respond_to do |format|
      format.html { render "get_results.html.erb" }
      format.js { render "get_results.erb.js" }
    end
  end

end
