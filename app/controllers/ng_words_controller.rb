class NgWordsController < ApplicationController

  # GET /ng_words/new
  # GET /ng_words/new.json
  def new
    @ng_word = NgWord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ng_word }
    end
  end

  # GET /ng_words/1/edit
  def edit
    @ng_word = NgWord.find(params[:id])
  end

  # POST /ng_words
  # POST /ng_words.json
  def create
    @ng_word = NgWord.new(params[:ng_word])
    @ng_word.account_id = @current_account.id

    respond_to do |format|
      if @ng_word.save
        format.html { redirect_to @current_account, notice: 'Ng word was successfully created.' }
        format.json { render json: @ng_word, status: :created, location: @ng_word }
      else
        format.html { render action: "new" }
        format.json { render json: @ng_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ng_words/1
  # PUT /ng_words/1.json
  def update
    @ng_word = NgWord.find(params[:id])

    respond_to do |format|
      if @ng_word.update_attributes(params[:ng_word])
        format.html { redirect_to @current_account, notice: 'Ng word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ng_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ng_words/1
  # DELETE /ng_words/1.json
  def destroy
    @ng_word = NgWord.find(params[:id])
    @ng_word.destroy

    respond_to do |format|
      format.html { redirect_to @current_account }
      format.json { head :no_content }
    end
  end
end
