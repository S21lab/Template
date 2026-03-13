// Token stored in sessionStorage — cleared when the browser tab/session ends.
// For persistent login, switch to localStorage and ensure your threat model is appropriate.

const TOKEN_KEY = 'auth_token';

export const setToken = (token) => {
    sessionStorage.setItem(TOKEN_KEY, token);
};

export const getToken = () => {
    return sessionStorage.getItem(TOKEN_KEY);
};

export const removeToken = () => {
    sessionStorage.removeItem(TOKEN_KEY);
};

export const login = async (username, password) => {
    const baseUrl = import.meta.env.VITE_API_BASE_URL || '/api/v1';
    const response = await fetch(`${baseUrl}/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password }),
    });

    if (!response.ok) {
        throw new Error('Invalid credentials');
    }

    const data = await response.json();
    setToken(data.token);
    return data;
};

export const logout = () => {
    removeToken();
    window.location.href = '/login';
};
