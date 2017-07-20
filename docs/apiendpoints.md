# API Endpoints

## HTML API

### Root

- `GET /` - load landing page - go to skill tree if logged in

## JSON API

### Users

- `POST /api/users`
- `PATCH /api/users`

### Session

- `POST /api/session`
- `DELETE /api/session`

### Module
- `Get /api/modules` - availability/names/descriptions
- `GET /api/modules/:id` - get module data => linked lessons
- `Post /api/modules` - post completed module

### Lesson

- `GET /api/lesson/:id` - get lesson data
- `POST /api/lesson/:id` - post lesson completion
