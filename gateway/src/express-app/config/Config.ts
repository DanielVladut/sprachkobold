import { AppConfig } from './AppConfig';

interface EnvironmentsConfig {
    dev: AppConfig;
    prod: AppConfig;
}

const config: EnvironmentsConfig = {
    dev: {
        Port: 3000
    },
    prod: {
        Port: 3000
    }
}

const environment = process.env.NODE_ENV || 'dev';
const appConfig = config[environment]

export { appConfig };