class SearchController < ApplicationController
 
   def get_results
    @category = params[:category] if params[:category]
    @tag = params[:tag] if params[:tag]
   
    if @category    
      if @tag.nil?
        # category only search
        @listings = Listing.where("tags like ?", "%#{@category}%").order("updated_at DESC")
      else
        # category and tag search 
        @listings_in_category = Listing.where("tags like ?", "%#{@category}%").order("updated_at DESC")

        @listings = []
        @listings_in_category.each do |list|
          if list.tags && list.tags.include?(@tag)
            @listings << list
          end
        end
      end
    else
      @listings = Listing.all
    end

    # response block
    respond_to do |format|
      format.html { render "get_results.html.erb" }
      format.js { render "get_results.erb.js" }
    end
  end
  
end
