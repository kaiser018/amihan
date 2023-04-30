
## Setup
1. Clone the repository:
```
git clone https://github.com/kaiser018/amihan
```
2. Navigate to the project directory:
```
cd amihan
```
3. Copy the `.env-sample` file to `.env` and update it with your database credentials:
```
cp .env-sample .env
```
4. Open the `.env` file using a text editor of your choice.
Replace the following placeholders with your database credentials:
```
SERVER_PORT=5001
DB_HOST=127.0.0.1
DB_USER=root
DB_PASSWORD=password
DB_DATABASE=amihan
```
5. Create a database for the service:
```
sh ./create.sh
```
6. Import sample data:
```
sh ./import.sh
```
7. Start container from the docker image:
```
sh ./start.sh
```