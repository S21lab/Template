import PropTypes from 'prop-types';
import { Routes, Route, Navigate } from 'react-router-dom';
import Login from './pages/Login';
import Dashboard from './pages/Dashboard';
import { getToken } from './services/auth';

function PrivateRoute({ children }) {
    return getToken() ? children : <Navigate to="/login" replace />;
}

PrivateRoute.propTypes = {
    children: PropTypes.node.isRequired,
};

export default function App() {
    return (
        <Routes>
            <Route path="/login" element={<Login />} />
            <Route
                path="/dashboard"
                element={
                    <PrivateRoute>
                        <Dashboard />
                    </PrivateRoute>
                }
            />
            <Route path="*" element={<Navigate to="/dashboard" replace />} />
        </Routes>
    );
}
