package com.taskmanager.service;

import com.taskmanager.model.Task;
import com.taskmanager.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    public Task createTask(Task task) {
        task.setCreatedAt(LocalDateTime.now());
        task.setUpdatedAt(LocalDateTime.now());
        if (task.getStatus() == null) {
            task.setStatus(Task.TaskStatus.PENDING);
        }
        if (task.getPriority() == null) {
            task.setPriority(Task.TaskPriority.MEDIUM);
        }
        return taskRepository.save(task);
    }

    public Optional<Task> getTaskById(Long id) {
        return taskRepository.findById(id);
    }

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public List<Task> getTasksByStatus(Task.TaskStatus status) {
        return taskRepository.findByStatus(status);
    }

    public List<Task> getTasksByPriority(Task.TaskPriority priority) {
        return taskRepository.findByPriority(priority);
    }

    public List<Task> getTasksByStatusAndPriority(Task.TaskStatus status, Task.TaskPriority priority) {
        return taskRepository.findByStatusAndPriority(status, priority);
    }

    public List<Task> searchTasks(String searchTerm) {
        return taskRepository.searchTasks(searchTerm);
    }

    public Task updateTask(Long id, Task taskDetails) {
        Optional<Task> taskOpt = taskRepository.findById(id);
        if (taskOpt.isPresent()) {
            Task task = taskOpt.get();
            if (taskDetails.getTitle() != null && !taskDetails.getTitle().isEmpty()) {
                task.setTitle(taskDetails.getTitle());
            }
            if (taskDetails.getDescription() != null) {
                task.setDescription(taskDetails.getDescription());
            }
            if (taskDetails.getStatus() != null) {
                task.setStatus(taskDetails.getStatus());
            }
            if (taskDetails.getPriority() != null) {
                task.setPriority(taskDetails.getPriority());
            }
            task.setUpdatedAt(LocalDateTime.now());
            return taskRepository.save(task);
        }
        throw new RuntimeException("Tarea no encontrada con ID: " + id);
    }

    public void deleteTask(Long id) {
        if (taskRepository.existsById(id)) {
            taskRepository.deleteById(id);
        } else {
            throw new RuntimeException("Tarea no encontrada con ID: " + id);
        }
    }

    public Long getTotalTaskCount() {
        return taskRepository.count();
    }

    public Long getCompletedTaskCount() {
        return taskRepository.findByStatus(Task.TaskStatus.COMPLETED).stream().count();
    }

    public Long getPendingTaskCount() {
        return taskRepository.findByStatus(Task.TaskStatus.PENDING).stream().count();
    }

}
