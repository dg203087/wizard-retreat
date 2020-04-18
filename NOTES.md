Associations

Wizard
has many registrations
has many courses, through registrations
email
password_digest
first name
last name
house
admin


Course
has many registrations
has many wizards, through registrations
name
description
location
maximum_participants

Wizard
signs up or signs in 
option to connect to facebook
can see all courses
can register for up to 3 courses
can edit or delete schedule
can see full schedule


Registration
belongs to wizard
belongs to course
wizard_id
course_id
time_slot


posts - wizards
display all courses/registrations on wizards show page
<% @wizard.courses.each do |course| %>
  <%= link_to course.title, course_path(course) %>
<% end %>


comments - registrations



categories/comments - courses
admins can see all wizards registered for courses
  <% @courses.registrations.each do |registration| %>
    <%= link_to registration.wizard.first_name, wizard_path(registration.wizard) %>
  <% end %>
  
for courses show page

Currently Registered: <%= @course.registration.current_participants %> Wizards
Time Slot: <%= @course.registration.time_slot %>

<%= form_tag("/registrations", method: "post") do %>
    <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
    <%= hidden_field_tag :course_id, @course.id %>
    <%= button_tag "Register for Course" %>
<% end %>


For courses new page
       <% Registration.all.each do |reg| %>
            
                <label for="time_slot"><%= reg.time_slot %>
                <input type="checkbox" name="registration[time_slot]" value="<%= reg.time_slot %>%">
            </p>
        <% end %>

            <%= f.fields_for :registration do |reg_fields| %>
                Time Slot(s): <%= reg_fields.check_box :time_slot %> <br /><br />
            <% end %>


on registration new
<h1><%= @registration.course.name %></h1>
<i><%= @registration.course.location %></i>

Registrations controller
    def create
        # if @registration #.only_three && no duplicates 
            registration = Registration.create(wizard_id: current_wizard.id, course_id: params[:course_id])
            # redirect_to wizard_path(registration.wizard)
            if registration 
                # registration.register
                # add You're all registered!
                # currently_enrolled += 1
                redirect_to wizard_path(registration.wizard)
            else
                # add Sorry class full/Sorry time slot full
                redirect_to course_path(registration.course)
            end
        # elsif registration.duplicate_reg


        # else
        #     # error message
        #     redirect_to wizard_path(registration.wizard)
        # end
    end



      <%= form_tag("/wizards", method: "get") do %>
    <%= select_tag "house", options_for_select("Gryffindor", "Slytherin", "Hufflepuff", "Ravenclaw"), include_blank: true %>
    <%= submit_tag "Filter" %>
  <% end %>


<h1>All Wizards Registered for <%= @course.name %>  </h1>

<ul>
    <% @course.registrations.each do |c| %>
        <li><%= c.wizard.full_name %></li>
    <% end %>
<ul>

    <% course.registrations.belongs_to_user %>
            Time Slot: <%= reg.time_slot %><br />
    <% end %>


        <% course.registrations.each do |reg| %>
        Time Slot: <%= reg.time_slot.belongs_to_wizard %><br />
    <% end %>