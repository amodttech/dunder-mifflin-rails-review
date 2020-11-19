class EmployeesController < ApplicationController
    validates :alias, uniqueness: true
    validates :title, uniqueness: true

    # def full_name
    #     @employee = 
    #     @employee.first_name + ' ' + @employee.last_name
    # end

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        # if Employee.all.any? {|employee| (employee.alias != params[:alias]) && (employee.title != params[:title])}
        @employee.update(employee_params)
        # end
        redirect_to employee_path(@employee)
    end

    def new
        @employee = Employee.new
    end

    def create
        # if Employee.all.any? {|employee| (employee.alias != params[:alias]) && (employee.title != params[:title])}
        @employee = Employee.create(employee_params)
        # @employee = Employee.create(employee_params[:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id])
        # end
        redirect_to employee_path(@employee)
    end


    private 

  def employee_params
    params.require(:employee).permit([:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id])
  end 

end




# mov_title = @@prompt.ask("What is the Movie title?", required: true)
#             does_movie_exist = Movie.all.any? {|movie| movie.title == mov_title}
#             does_review_exist = Review.all.any? {|review| (review.movie.title == mov_title) && (review.user.name == @@user.name)}
#         if (does_movie_exist == true) && (does_review_exist == false)
#             puts "\n\n"
#             mov_rating = @@prompt.ask("How many stars out of five would you rate this movie?", convert: :int)
#             mov = Movie.find_by(title: mov_title)
#             new_review = Review.create(user: @@user, movie: mov, rating: mov_rating)
#             puts "\n\n"
#             puts "New review has been recorded!  You have given #{Rainbow(new_review.movie.title).orange} a rating of #{Rainbow(new_review.rating).salmon}."
#             puts "\n\n"
#         elsif (does_movie_exist == true) && (does_review_exist == true)
#             old_review = Review.all.select {|review| (review.movie.title == mov_title) && (review.user.name == @@user.name)}.first
#             puts "\n"
#             puts "You have previously given #{Rainbow(mov_title).orange} a rating of #{Rainbow(old_review.rating).salmon}."
#             puts "\n\n"
#         else
#             puts "Sorry #{Rainbow(@@user.name).coral}, but #{Rainbow(mov_title).orange} doesn't exist in our system yet."
#             puts "\n\n"
#         end

# class Account < ApplicationRecord
#     validates :email, uniqueness: true
#   end