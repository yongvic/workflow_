-- Table: projet
CREATE TABLE projet(
    id_projet SERIAL PRIMARY KEY,
    description_projet TEXT NOT NULL,
    nom_projet VARCHAR(50) NOT NULL,
    statut_projet VARCHAR(50) NOT NULL,
    delai_projet DATE NOT NULL,
    date_creation_projet DATE NOT NULL
);

-- Table: tache
CREATE TABLE tache(
    id_tache SERIAL PRIMARY KEY,
    nom_tache VARCHAR(50) NOT NULL,
    description_tache TEXT NOT NULL,
    statut_tache VARCHAR(50) NOT NULL,
    assignation VARCHAR(50) NOT NULL,
    priorite VARCHAR(50) NOT NULL,
    date_creation_tache DATE NOT NULL
);

-- Table: progression
CREATE TABLE progression(
    id_progression SERIAL PRIMARY KEY,
    date_last_update DATE NOT NULL,
    nbre_projet_complete INT NOT NULL,
    nbre_task_complete INT NOT NULL
);

-- Table: utilisateur
CREATE TABLE utilisateur(
    id_utilisateur SERIAL PRIMARY KEY,
    nom_utilisateur VARCHAR(50) NOT NULL,
    prenom_utilisateur VARCHAR(50),
    email_utilisateur VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    avatar VARCHAR(255) NOT NULL,
    date_inscription DATE NOT NULL,
    type_utilisateur VARCHAR(50) NOT NULL,
    id_progression INT NOT NULL,
    CONSTRAINT utilisateur_progression_FK FOREIGN KEY (id_progression) REFERENCES progression(id_progression)
);

-- Table: notification
CREATE TABLE notification(
    id_notification SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    date_notification DATE NOT NULL,
    statut_notification VARCHAR(50) NOT NULL,
    id_utilisateur INT NOT NULL,
    CONSTRAINT notification_utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
);

-- Table: fichier
CREATE TABLE fichier(
    id_fichier SERIAL PRIMARY KEY,
    nom_fichier VARCHAR(50) NOT NULL,
    url_fichier VARCHAR(255) NOT NULL,
    type_fichier VARCHAR(50) NOT NULL,
    date_upload DATE NOT NULL,
    id_utilisateur INT NOT NULL,
    id_tache INT NOT NULL,
    CONSTRAINT fichier_utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    CONSTRAINT fichier_tache_FK FOREIGN KEY (id_tache) REFERENCES tache(id_tache)
);

-- Table: participation
CREATE TABLE participation(
    id_tache INT NOT NULL,
    id_projet INT NOT NULL,
    id_utilisateur INT NOT NULL,
    PRIMARY KEY (id_tache, id_projet, id_utilisateur),
    CONSTRAINT participation_tache_FK FOREIGN KEY (id_tache) REFERENCES tache(id_tache),
    CONSTRAINT participation_projet_FK FOREIGN KEY (id_projet) REFERENCES projet(id_projet),
    CONSTRAINT participation_utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
);

-- Table: appartenir
CREATE TABLE appartenir(
    id_fichier INT NOT NULL,
    id_projet INT NOT NULL,
    PRIMARY KEY (id_fichier, id_projet),
    CONSTRAINT appartenir_fichier_FK FOREIGN KEY (id_fichier) REFERENCES fichier(id_fichier),
    CONSTRAINT appartenir_projet_FK FOREIGN KEY (id_projet) REFERENCES projet(id_projet)
);
