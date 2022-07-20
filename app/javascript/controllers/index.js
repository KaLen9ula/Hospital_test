// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DoctorByCategoryController from "./doctor_category_controller"
application.register("doctor_category", DoctorByCategoryController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import MakeAppointmentController from "./make_appointment_controller"
application.register("make_appointment", MakeAppointmentController)

import CreateRecommendationController from "./create_recommendation_controller"
application.register("create_recommendation", CreateRecommendationController)
