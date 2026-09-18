package controller.Promotions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Employees.Designation;
import models.Employees.User;
import models.Promotions.Promotion;
import service.Designation.DesignationService;
import service.Promotions.PromotionService;
import service.User.UserService;
import serviceImplementer.Auth.UserServiceImpl;
import serviceImplementer.Designation.DesignationServiceImpl;
import serviceImplementer.Promotions.PromotionServiceImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/promotion")
public class PromotionServlet extends HttpServlet {

    private PromotionService promotionService;
    private UserService userService;
    private DesignationService designationService;


    @Override
    public void init() throws ServletException {

        promotionService = new PromotionServiceImpl();

        userService = new UserServiceImpl();

        designationService = new DesignationServiceImpl();
    }


    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String action =
                    request.getParameter("action");


            // =================================================
            // ADD PROMOTION PAGE
            // /promotion?action=add
            // =================================================

            if ("add".equals(action)) {

                loadFormData(request);

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addPromotion.jsp"
                ).forward(request, response);

                return;
            }


            // =================================================
            // EDIT PROMOTION PAGE
            // /promotion?action=edit&id=5
            // =================================================

            if ("edit".equals(action)) {

                int promotionId =
                        Integer.parseInt(
                                request.getParameter("id")
                        );


                Promotion promotion =
                        promotionService.getPromotionById(
                                promotionId
                        );


                if (promotion == null) {

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/promotion"
                    );

                    return;
                }


                loadFormData(request);


                request.setAttribute(
                        "promotion",
                        promotion
                );


                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addPromotion.jsp"
                ).forward(request, response);

                return;
            }


            // =================================================
            // PROMOTION LIST PAGE
            // /promotion
            // =================================================

            List<Promotion> promotions =
                    promotionService.getAllPromotions();


            request.setAttribute(
                    "promotions",
                    promotions
            );


            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/Promotion.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            throw new ServletException(
                    "Unable to load promotion page",
                    e
            );
        }
    }


    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // =================================================
            // GET ACTION
            // =================================================

            String action =
                    request.getParameter("action");


            // =================================================
            // DELETE PROMOTION
            // =================================================

            if ("delete".equals(action)) {

                int promotionId =
                        Integer.parseInt(
                                request.getParameter(
                                        "promotionId"
                                )
                        );


                // DELETE from database
                promotionService.deletePromotion(
                        promotionId
                );


                // Go back to promotion list
                response.sendRedirect(
                        request.getContextPath()
                                + "/promotion"
                );

                return;
            }


            // =================================================
            // GET FORM VALUES
            // =================================================

            int userId =
                    Integer.parseInt(
                            request.getParameter("userId")
                    );


            String designationFrom =
                    request.getParameter(
                            "designationFrom"
                    );


            String designationTo =
                    request.getParameter(
                            "designationTo"
                    );


            String date =
                    request.getParameter(
                            "date"
                    );


            // =================================================
            // DATE
            // =================================================

            DateTimeFormatter formatter =
                    DateTimeFormatter.ofPattern(
                            "dd/MM/yyyy"
                    );


            LocalDate promotionDate =
                    LocalDate.parse(
                            date,
                            formatter
                    );


            // =================================================
            // EDIT PROMOTION
            // =================================================

            if ("edit".equals(action)) {

                int promotionId =
                        Integer.parseInt(
                                request.getParameter(
                                        "promotionId"
                                )
                        );


                Promotion promotion =
                        new Promotion();


                promotion.setPromotionId(
                        promotionId
                );


                promotion.setUserId(
                        userId
                );


                promotion.setDesignationFrom(
                        designationFrom
                );


                promotion.setDesignationTo(
                        designationTo
                );


                promotion.setDate(
                        promotionDate.atStartOfDay()
                );


                // UPDATE existing promotion
                promotionService.updatePromotion(
                        promotion
                );


                // Go back to promotion list
                response.sendRedirect(
                        request.getContextPath()
                                + "/promotion"
                );

                return;
            }


            // =================================================
            // ADD PROMOTION
            // =================================================

            Promotion promotion =
                    new Promotion();


            promotion.setUserId(
                    userId
            );


            promotion.setDesignationFrom(
                    designationFrom
            );


            promotion.setDesignationTo(
                    designationTo
            );


            promotion.setDate(
                    promotionDate.atStartOfDay()
            );


            // INSERT new promotion
            promotionService.addPromotion(
                    promotion
            );


            // Go back to promotion list
            response.sendRedirect(
                    request.getContextPath()
                            + "/promotion"
            );


        } catch (Exception e) {

            throw new ServletException(
                    "Unable to save promotion",
                    e
            );
        }
    }


    // =========================================================
    // LOAD FORM DATA
    // =========================================================

    private void loadFormData(
            HttpServletRequest request) {

        // Employees for dropdown
        List<User> users =
                userService.getAllEmployees();


        // Designations for dropdown
        List<Designation> designations =
                designationService.getAllDesignations();


        request.setAttribute(
                "users",
                users
        );


        request.setAttribute(
                "designations",
                designations
        );
    }
}