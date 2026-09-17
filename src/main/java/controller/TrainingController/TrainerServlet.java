package controller.TrainingController;

import dao.Trainers.TrainerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Trainers.Trainer;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/trainers", "/trainers/add"})
public class TrainerServlet extends HttpServlet {

    private TrainerDao trainerDao;

    @Override
    public void init() {
        trainerDao = new TrainerDao();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        try {

            if ("/trainers/add".equals(path)) {

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addTrainer.jsp"
                ).forward(request, response);

                return;
            }

            String action = request.getParameter("action");

            if ("delete".equalsIgnoreCase(action)) {

                String idParameter = request.getParameter("id");

                if (idParameter != null && !idParameter.isEmpty()) {

                    int id = Integer.parseInt(idParameter);

                    try {
                        trainerDao.deleteTrainer(id);

                    } catch (IllegalStateException e) {

                        request.getSession().setAttribute(
                                "trainerDeleteError",
                                "This trainer is linked with existing training records and cannot be deleted. Please mark the trainer as Inactive."
                        );
                    }
                }

                response.sendRedirect(
                        request.getContextPath() + "/trainers"
                );

                return;
            }


            List<Trainer> trainers =
                    trainerDao.getAllTrainers();

            request.setAttribute("trainers", trainers);

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/trainers.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to process Trainer",
                    e
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        try {

            String firstName =
                    request.getParameter("firstName");

            String lastName =
                    request.getParameter("lastName");

            String role =
                    request.getParameter("role");

            String email =
                    request.getParameter("email");

            String description =
                    request.getParameter("description");

            String status =
                    request.getParameter("status");

            String phoneParameter =
                    request.getParameter("phone");

            String profilePicture =
                    request.getParameter("profilePicture");

            Trainer trainer = new Trainer();

            trainer.setFirstName(firstName);
            trainer.setLastName(lastName);
            trainer.setRole(role);
            trainer.setEmail(email);
            trainer.setDescription(description);
            trainer.setStatus(status);

            if (phoneParameter != null &&
                    !phoneParameter.isEmpty()) {

                trainer.setPhone(
                        Long.parseLong(phoneParameter)
                );
            }

            trainer.setProfilePicture(profilePicture);

            if ("update".equalsIgnoreCase(action)) {

                String idParameter =
                        request.getParameter("trainerId");

                int id =
                        Integer.parseInt(idParameter);

                trainer.setTrainerId(id);

                trainerDao.updateTrainer(trainer);

            } else {

                trainerDao.addTrainer(trainer);
            }

            response.sendRedirect(
                    request.getContextPath() + "/trainers"
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to save Trainer",
                    e
            );
        }
    }
}