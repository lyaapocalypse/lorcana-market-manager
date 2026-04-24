# Lorcana Market Manager

Web application developed with Flask and MariaDB to manage a Lorcana card market database.

## Features

- Manage sets
- Manage cards
- Manage copies
- Manage contacts
- Manage transactions
- Manage transaction details
- Full CRUD operations
- MariaDB remote connection

## Technologies

- Python
- Flask
- MariaDB
- HTML
- Jinja2

## Project structure

```text
lorcana-market-manager/
├── app.py
├── db_config.py
├── lorcana_market_manager.sql
├── README.md
└── templates/
```

## Database

The repository includes `lorcana_market_manager.sql`, containing:
- Database structure
- Tables
- Relationships
- Sample/project data

## Installation

1. Clone the repository:
```bash
git clone https://github.com/TU_USUARIO/lorcana-market-manager.git
cd lorcana-market-manager
```

2. Install dependencies:
```bash
pip install flask mysql-connector-python
```

3. Import the database:
```bash
mariadb -u root -p < lorcana_market_manager.sql
```

4. Configure database credentials in `db_config.py`.

5. Run the app:
```bash
python app.py
```

## Access

Open in browser:
```text
http://127.0.0.1:5001/
```

## Authors

- Camelia Álvarez Díaz
