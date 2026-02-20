package com.taskmanager.config;

import com.taskmanager.model.Task;
import com.taskmanager.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataLoader implements CommandLineRunner {

    @Autowired
    private TaskRepository taskRepository;

    @Override
    public void run(String... args) throws Exception {
        // Crear tareas de ejemplo
        Task task1 = new Task();
        task1.setTitle("Estudiar Spring Boot");
        task1.setDescription("Aprender los conceptos básicos de Spring Boot y crear una aplicación REST");
        task1.setStatus(Task.TaskStatus.IN_PROGRESS);
        task1.setPriority(Task.TaskPriority.HIGH);

        Task task2 = new Task();
        task2.setTitle("Comprar ingredientes");
        task2.setDescription("Ir al supermercado a comprar ingredientes para la cena");
        task2.setStatus(Task.TaskStatus.PENDING);
        task2.setPriority(Task.TaskPriority.MEDIUM);

        Task task3 = new Task();
        task3.setTitle("Revisar código");
        task3.setDescription("Hacer revisión de código del proyecto anterior");
        task3.setStatus(Task.TaskStatus.COMPLETED);
        task3.setPriority(Task.TaskPriority.HIGH);

        Task task4 = new Task();
        task4.setTitle("Llamar al cliente");
        task4.setDescription("Contactar al cliente para confirmar reunión");
        task4.setStatus(Task.TaskStatus.PENDING);
        task4.setPriority(Task.TaskPriority.URGENT);

        Task task5 = new Task();
        task5.setTitle("Escribir documentación");
        task5.setDescription("Documentar las APIs del proyecto");
        task5.setStatus(Task.TaskStatus.IN_PROGRESS);
        task5.setPriority(Task.TaskPriority.MEDIUM);

        taskRepository.save(task1);
        taskRepository.save(task2);
        taskRepository.save(task3);
        taskRepository.save(task4);
        taskRepository.save(task5);

        System.out.println("✓ Datos de ejemplo cargados correctamente");
    }
}
