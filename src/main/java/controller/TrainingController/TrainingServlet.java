package controller.TrainingController;

import dao.Trainers.TrainerDao;
import dao.Trainers.TrainingDao;
import dao.Trainers.TrainingTypeDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Trainers.Trainer;
import models.Trainers.Training;
import models.Trainers.TrainingType;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = {"/trainings", "/trainings/add"})
public class TrainingServlet extends HttpServlet {

    private TrainingDao trainingDao;
    private TrainerDao trainerDao;
    private TrainingTypeDao trainingTypeDao;

    private final DateTimeFormatter dateTimeFormatter =
            DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    @Override
    public void init() {
        trainingDao = new TrainingDao();
        trainerDao = new TrainerDao();
        trainingTypeDao = new TrainingTypeDao();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        try {

            // ADD TRAINING
            if ("/trainings/add".equals(path)) {

                List<Trainer> trainers =
                        trainerDao.getAllTrainers();

                List<TrainingType> trainingTypes =
                        trainingTypeDao.getAllTrainingTypes();

                List<models.Employees.User> users =
                        trainingDao.getAllUsers();

                request.setAttribute(
                        "trainers",
                        trainers
                );

                request.setAttribute(
                        "trainingTypes",
                        trainingTypes
                );

                request.setAttribute(
                        "users",
                        users
                );

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addTraining.jsp"
                ).forward(request, response);

                return;
            }


            String action =
                    request.getParameter("action");


            // EDIT TRAINING
            if ("edit".equalsIgnoreCase(action)) {

                String idParameter =
                        request.getParameter("id");

                if (idParameter != null
                        && !idParameter.isEmpty()) {

                    int id =
                            Integer.parseInt(idParameter);

                    Training training =
                            trainingDao.getTrainingById(id);

                    List<Trainer> trainers =
                            trainerDao.getAllTrainers();

                    List<TrainingType> trainingTypes =
                            trainingTypeDao.getAllTrainingTypes();

                    List<models.Employees.User> users =
                            trainingDao.getAllUsers();

                    request.setAttribute(
                            "training",
                            training
                    );

                    request.setAttribute(
                            "trainers",
                            trainers
                    );

                    request.setAttribute(
                            "trainingTypes",
                            trainingTypes
                    );

                    request.setAttribute(
                            "users",
                            users
                    );

                    request.getRequestDispatcher(
                            "/WEB-INF/views/Admin/addTraining.jsp"
                    ).forward(request, response);

                    return;
                }
            }



            if ("delete".equalsIgnoreCase(action)) {

                String idParameter =
                        request.getParameter("id");

                if (idParameter != null
                        && !idParameter.isEmpty()) {

                    int id =
                            Integer.parseInt(idParameter);

                    trainingDao.deleteTraining(id);
                }

                response.sendRedirect(
                        request.getContextPath()
                                + "/trainings"
                );

                return;
            }



            List<Training> trainings =
                    trainingDao.getAllTrainings();

            List<Trainer> trainers =
                    trainerDao.getAllTrainers();

            List<TrainingType> trainingTypes =
                    trainingTypeDao.getAllTrainingTypes();

            request.setAttribute(
                    "trainings",
                    trainings
            );

            request.setAttribute(
                    "trainers",
                    trainers
            );

            request.setAttribute(
                    "trainingTypes",
                    trainingTypes
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/trainings.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to process Training",
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

            int trainerId =
                    Integer.parseInt(
                            request.getParameter("trainerId")
                    );

            int trainingTypeId =
                    Integer.parseInt(
                            request.getParameter("trainingTypeId")
                    );

            int userId =
                    Integer.parseInt(
                            request.getParameter("userId")
                    );

            double trainingCost =
                    Double.parseDouble(
                            request.getParameter("trainingCost")
                    );

            String description =
                    request.getParameter("description");

            String status =
                    request.getParameter("status");

            String startDateParameter =
                    request.getParameter("startDate");

            String endDateParameter =
                    request.getParameter("endDate");

            LocalDateTime startDate =
                    LocalDateTime.parse(
                            startDateParameter,
                            dateTimeFormatter
                    );

            LocalDateTime endDate =
                    LocalDateTime.parse(
                            endDateParameter,
                            dateTimeFormatter
                    );


            Training training =
                    new Training();

            training.setTrainerId(
                    trainerId
            );

            training.setTrainingTypeId(
                    trainingTypeId
            );

            training.setUserId(
                    userId
            );

            training.setTrainingCost(
                    trainingCost
            );

            training.setDescription(
                    description
            );

            training.setStatus(
                    status
            );

            training.setStartDate(
                    startDate
            );

            training.setEndDate(
                    endDate
            );



            if ("update".equalsIgnoreCase(action)) {

                int trainingId =
                        Integer.parseInt(
                                request.getParameter(
                                        "trainingId"
                                )
                        );

                String modifiedBy =
                        request.getParameter(
                                "modifiedBy"
                        );

                training.setTrainingId(
                        trainingId
                );

                training.setModifiedBy(
                        modifiedBy
                );

                trainingDao.updateTraining(
                        training
                );

            }

            // ADD
            else {

                String createdBy =
                        request.getParameter(
                                "createdBy"
                        );

                training.setCreatedBy(
                        createdBy
                );

                trainingDao.addTraining(
                        training
                );
            }


            response.sendRedirect(
                    request.getContextPath()
                            + "/trainings"
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to save Training",
                    e
            );
        }
    }
}