from fastapi.testclient import TestClient

from app.application import create_app


def test_client() -> TestClient:
    return TestClient(create_app())


def test_health():
    response = test_client().get("/health/")
    assert response.status_code == 200
    assert response.json() != {}
