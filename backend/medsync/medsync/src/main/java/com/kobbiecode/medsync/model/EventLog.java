package com.kobbiecode.medsync.model;


import jakarta.persistence.*;
import lombok.*;


import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "event_logs")
public class EventLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String eventType; // e.g., "MISSED_MEDICATION_ALERT"

    @Column(nullable = false)
    private String payload; // Stores JSON message data

    @Column(nullable = false)
    private LocalDateTime timestamp = LocalDateTime.now();
}
