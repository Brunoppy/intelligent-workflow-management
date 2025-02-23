-- SQL Script for Intelligent Workflow Management
CREATE TABLE workflows (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    workflow_id INT REFERENCES workflows(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    assigned_to VARCHAR(255),
    status VARCHAR(50) CHECK (status IN ('Pending', 'In Progress', 'Completed', 'On Hold')),
    priority VARCHAR(50) CHECK (priority IN ('Low', 'Medium', 'High', 'Critical')),
    due_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE workflow_logs (
    id SERIAL PRIMARY KEY,
    workflow_id INT REFERENCES workflows(id) ON DELETE CASCADE,
    action VARCHAR(255) NOT NULL,
    performed_by VARCHAR(255) NOT NULL,
    performed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE automation_rules (
    id SERIAL PRIMARY KEY,
    workflow_id INT REFERENCES workflows(id) ON DELETE CASCADE,
    trigger_event VARCHAR(255) NOT NULL,
    action VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
