package controllers;

import play.*;
import play.mvc.*;
import play.api.templates.BufferedContent;
import play.api.templates.Html;
import play.data.*;
import models.*;
import views.html.*;
import play.libs.Json;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;


/**
 * @author Tyler Carroll
 *
 */
public class Application extends Controller {

    static Form<UserContainer> userForm = Form.form(UserContainer.class);
    static Form<Report> reportForm = Form.form(Report.class);

    /**
     * Redirects index to users
     * 
     * @return returns redirect to users route
     */
    public static Result index() {
        return redirect(routes.Application.users());
    }

    /* User functions */
    /**
     * Renders users page for Scala front end for debugging only
     * 
     * @return returns user page
     */
    public static Result users() {
        return ok(views.html.user.render(UserContainer.all(), userForm));
    }

    /**
     * Creates new user in database from Scala front end for debugging only
     * 
     * @return returns user page
     */
    public static Result newUser() {
        Form<UserContainer> filledForm = userForm.bindFromRequest();
        if (filledForm.hasErrors()) {
            return badRequest(views.html.user.render(UserContainer.all(), filledForm));
        } else {
            UserContainer.create(filledForm.get());
            return redirect(routes.Application.users());
        }
    }
    
    /**
     * Creates new user in database from JSON POST request from client
     * 
     * @return 200 OK
     */
    public static Result createUser() {
        JsonNode json = request().body().asJson();
        UserContainer.create(Json.fromJson(json, UserContainer.class));
        return ok();
    }
    
    /**
     * Gets user by id from database
     * 
     * @param id id of user to get from database
     * @return   200 OK with JSON data of user
     */
    public static Result getUser(Long id) {
    	return(ok(Json.toJson(UserContainer.get(id))));
    }
    
   /**
    * Gets user by username from database
    * 
    * @param name username of user to get from database
    * @return     200 OK with JSON data of user
    */
    public static Result getByUserName(String name) {
    	return(ok(Json.toJson(UserContainer.getByUserName(name))));
    }
    
   /**
    * Check password of user sent by JSON POST request from client
    * 
    * @return 200 OK or 404 NOT FOUND
    */
    public static Result checkPassword() {
        JsonNode json = request().body().asJson();
        if (Json.fromJson(json, UserContainer.class).password.equals( 
        		UserContainer.getByUserName(Json.fromJson(json, UserContainer.class).userName).password)) {
        	return ok();
        } else {
        	return notFound();
        }
    }
    
    /**
     * Delete user by id from database
     * 
     * @param id id of user to delete
     * @return   returns user page
     */
    public static Result deleteUser(Long id) {
        UserContainer.delete(id);
        return redirect(routes.Application.users());
    }

    /* Report functions */
    /**
     * Renders reports page for Scala front end for debugging only
     * 
     * @return returns report page
     */
    public static Result reports() {
        return ok(views.html.report.render(Report.all(), reportForm));
    }

    /**
     * Creates new report in database from Scala front end for debugging only
     * 
     * @return returns report page
     */
    public static Result newReport() {
        Form<Report> filledForm = reportForm.bindFromRequest();
        if (filledForm.hasErrors()) {
            return badRequest(views.html.report.render(Report.all(), filledForm));
        } else {
            Report.create(filledForm.get());
            return redirect(routes.Application.reports());
        }
    }
    
    /**
     * Creates new report in database from JSON POST request from client
     * 
     * @return 200 OK
     */
    public static Result createReport() {
        JsonNode json = request().body().asJson();
        Report.create(Json.fromJson(json, Report.class));
        return ok();
    }
    
    /**
     * Gets report by id from database
     * 
     * @param id id of report to get from database
     * @return   200 OK with JSON data of report
     */
    public static Result getReport(Long id) {
    	return(ok(Json.toJson(Report.get(id))));
    }

    /**
     * Delete report by id from database
     * 
     * @param id id of report to delete
     * @return   returns report page
     */
    public static Result deleteReport(Long id) {
        Report.delete(id);
        return redirect(routes.Application.reports());
    }
}

