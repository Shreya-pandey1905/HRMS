package controller.TrainingController;

import dao.Trainers.TrainingTypeDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Trainers.TrainingType;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/training-type", "/training-type/add"})
public class TrainingTypeServlet extends HttpServlet {

    private TrainingTypeDao trainingTypeDao;

    @Override
    public void init() {
        trainingTypeDao = new TrainingTypeDao();
    }

    // ================= GET =================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        try {

            // ================= OPEN ADD PAGE =================

            if ("/training-type/add".equals(path)) {

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addTrainingType.jsp"
                ).forward(request, response);

                return;
            }

            String action = request.getParameter("action");

            // ================= DELETE =================

            if ("delete".equalsIgnoreCase(action)) {

                String idParameter =
                        request.getParameter("id");

                if (idParameter != null
                        && !idParameter.isEmpty()) {

                    int id = Integer.parseInt(idParameter);

                    trainingTypeDao.deleteTrainingType(id);
                }

                response.sendRedirect(
                        request.getContextPath()
                                + "/training-type"
                );

                return;
            }

            // ================= GET ALL =================

            List<TrainingType> trainingTypes =
                    trainingTypeDao.getAllTrainingTypes();

            request.setAttribute(
                    "trainingTypes",
                    trainingTypes
            );

            // ================= OPEN LIST JSP =================

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/trainingType.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to process Training Type",
                    e
            );
        }
    }

    // ================= POST =================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        try {

            // ================= FORM VALUES =================

            String trainingTypeName =
                    request.getParameter("trainingTypeName");

            String description =
                    request.getParameter("description");

            String status =
                    request.getParameter("status");

            // ================= CREATE OBJECT =================

            TrainingType trainingType =
                    new TrainingType();

            trainingType.setTrainingTypeName(
                    trainingTypeName
            );

            trainingType.setDescription(
                    description
            );

            trainingType.setStatus(
                    status
            );

            // ================= UPDATE =================

            if ("update".equalsIgnoreCase(action)) {

                String idParameter =
                        request.getParameter(
                                "trainingTypeId"
                        );

                int id =
                        Integer.parseInt(idParameter);

                trainingType.setTrainingTypeId(id);

                trainingTypeDao.updateTrainingType(
                        trainingType
                );
            }

            // ================= ADD =================

            else {

                trainingTypeDao.addTrainingType(
                        trainingType
                );
            }

            // ================= REDIRECT =================

            response.sendRedirect(
                    request.getContextPath()
                            + "/training-type"
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to save Training Type",
                    e
            );
        }
    }
}