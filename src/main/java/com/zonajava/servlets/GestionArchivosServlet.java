package com.zonajava.servlets;

import java.io.IOException;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/GestionArchivosServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 50     // 50 MB
)
public class GestionArchivosServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "assets";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<String[]> archivos = listarArchivos(request);
        request.setAttribute("archivos", archivos);

        request.getRequestDispatcher("admin-archivos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("subir".equals(action)) {
            subirArchivo(request);
        } else if ("eliminar".equals(action)) {
            eliminarArchivo(request);
        }

        doGet(request, response);
    }

    private String getUploadPath(HttpServletRequest request) {
        String appPath = request.getServletContext().getRealPath("");

        File buildWeb = new File(appPath);
        File build = buildWeb.getParentFile();
        File project = build.getParentFile();

        String[] posiblesRutas = {
            project.getAbsolutePath() + File.separator + "web" + File.separator + "assets",
            project.getAbsolutePath() + File.separator + "Web Pages" + File.separator + "assets",
            project.getAbsolutePath() + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "assets",
            appPath + File.separator + "assets"
        };

        for (String ruta : posiblesRutas) {
            File dir = new File(ruta);
            if (dir.exists() && dir.isDirectory()) {
                return ruta;
            }
        }

        return appPath + File.separator + "assets";
    }

    private List<String[]> listarArchivos(HttpServletRequest request) {
        List<String[]> archivos = new ArrayList<>();

        String uploadPath = getUploadPath(request);
        File uploadDir = new File(uploadPath);

        if (uploadDir.exists() && uploadDir.isDirectory()) {
            File[] files = uploadDir.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isFile()) {
                        String[] info = new String[4];
                        info[0] = file.getName();
                        info[1] = formatearTamano(file.length());
                        info[2] = UPLOAD_DIR + "/" + file.getName();
                        String nombre = file.getName().toLowerCase();
                        if (nombre.endsWith(".jpg") || nombre.endsWith(".jpeg") || nombre.endsWith(".png") || nombre.endsWith(".gif") || nombre.endsWith(".webp")) {
                            info[3] = "imagen";
                        } else if (nombre.endsWith(".pdf")) {
                            info[3] = "pdf";
                        } else if (nombre.endsWith(".css") || nombre.endsWith(".js")) {
                            info[3] = "codigo";
                        } else {
                            info[3] = "otro";
                        }
                        archivos.add(info);
                    }
                }
            }
        }

        return archivos;
    }

    private void subirArchivo(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("archivo");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            String uploadPath = getUploadPath(request);

            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            Path filePath = Paths.get(uploadPath, fileName);
            Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            request.setAttribute("mensaje", "Archivo subido: " + fileName);
        }
    }

    private void eliminarArchivo(HttpServletRequest request) {
        String nombre = request.getParameter("nombre");
        if (nombre != null) {
            String filePath = getUploadPath(request) + File.separator + nombre;
            File file = new File(filePath);

            if (file.exists() && file.delete()) {
                request.setAttribute("mensaje", "Archivo eliminado: " + nombre);
            } else {
                request.setAttribute("error", "No se pudo eliminar: " + nombre);
            }
        }
    }

    private String formatearTamano(long bytes) {
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) return String.format("%.1f KB", bytes / 1024.0);
        return String.format("%.1f MB", bytes / (1024.0 * 1024));
    }
}