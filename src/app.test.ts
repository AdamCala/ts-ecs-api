import request from 'supertest';
import app from './app';

describe('GET /health', () => {
  it('should respond with a 200 status code and a health message', async () => {
    const response = await request(app).get('/health');
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual({ status: 'UP' });
  });
});