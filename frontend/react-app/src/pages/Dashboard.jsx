import { useState, useEffect } from 'react';
import { logout } from '../services/auth';
import api from '../services/api';

export default function Dashboard() {
    const [health, setHealth] = useState(null);

    useEffect(() => {
        api.get('/health')
            .then((res) => setHealth(res.data))
            .catch(() => setHealth({ status: 'UNREACHABLE' }));
    }, []);

    return (
        <div style={{ padding: '2rem', maxWidth: '960px', margin: '0 auto' }}>
            <header
                style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                    marginBottom: '2rem',
                }}
            >
                <h1>Dashboard</h1>
                <button
                    onClick={logout}
                    style={{
                        padding: '0.4rem 1rem',
                        background: '#e74c3c',
                        color: '#fff',
                        border: 'none',
                        borderRadius: '4px',
                    }}
                >
                    Logout
                </button>
            </header>

            <section
                style={{
                    background: '#fff',
                    padding: '1.5rem',
                    borderRadius: '8px',
                    border: '1px solid #ddd',
                }}
            >
                <h2 style={{ marginBottom: '1rem' }}>API Status</h2>
                {health ? (
                    <dl
                        style={{ display: 'grid', gridTemplateColumns: '140px 1fr', gap: '0.5rem' }}
                    >
                        <dt>Status</dt>
                        <dd
                            style={{
                                color: health.status === 'UP' ? '#27ae60' : '#e74c3c',
                                fontWeight: 600,
                            }}
                        >
                            {health.status}
                        </dd>
                        {health.service && (
                            <>
                                <dt>Service</dt>
                                <dd>{health.service}</dd>
                            </>
                        )}
                        {health.timestamp && (
                            <>
                                <dt>Timestamp</dt>
                                <dd>{health.timestamp}</dd>
                            </>
                        )}
                    </dl>
                ) : (
                    <p>Loading…</p>
                )}
            </section>
        </div>
    );
}
