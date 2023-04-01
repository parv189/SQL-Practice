ALTER TABLE job_history ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history DROP CONSTRAINT fk_job_id;
ALTER TABLE job_history ADD location VARCHAR(30);