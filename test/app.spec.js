const request = require('supertest')('https://something.dev-tester.com/api');
const expect = require('chai');

describe.todo('GET /things ', function () {
  it('returns all the things, limited to 30 per page', async function () {
    const response = await request.get('/things');

    expect(response.status).to.eql(200);
    expect(response.body.data.length).to.eql(30);
  });
});
