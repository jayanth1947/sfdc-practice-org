// eslint-disable-next-line @lwc/lwc/no-unexpected-import
import { createElement } from 'lwc';
import NavigateToObjectPage from 'c/navigateToObjectPage';
import { NavigationMixin } from 'lightning/navigation';

const mockNavigateTo = jest.fn();

// Add the NavigationMixin.Navigate function to the target object.
NavigateToObjectPage.prototype[NavigationMixin.Navigate] = mockNavigateTo;

describe('c-navigate-to-object-page', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
        jest.clearAllMocks();
    });

    // Helper function to wait until the microtask queue is empty. This is needed for promise
    // timing when calling imperative Apex.
    async function flushPromises() {
        return Promise.resolve();
    }

    it('navigates to new record page', async () => {
        // Nav param values to test later
        const NAV_TYPE = 'standard__objectPage';
        const OBJECT_NAME = 'Contact';
        const ACTION_NAME = 'new';

        // Create initial lwc element and attach to virtual DOM
        const element = createElement('c-navigate-to-object-page', {
            is: NavigateToObjectPage
        });
        document.body.appendChild(element);

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Get handle to button and fire click event
        const buttonEl = element.shadowRoot.querySelector('lightning-button');
        buttonEl.click();

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Check if the mockNavigateTo function was called
        expect(mockNavigateTo).toHaveBeenCalled();

        // Check if the mockNavigateTo function was called with the correct params
        const expectedNavParams = {
            type: NAV_TYPE,
            attributes: {
                objectApiName: OBJECT_NAME,
                actionName: ACTION_NAME
            }
        };
        expect(mockNavigateTo).toHaveBeenCalledWith(expectedNavParams);
    });

    it('navigates to new record page with default values', async () => {
        // Nav param values to test later
        const NAV_TYPE = 'standard__objectPage';
        const OBJECT_NAME = 'Contact';
        const ACTION_NAME = 'new';

        // Create initial lwc element and attach to virtual DOM
        const element = createElement('c-navigate-to-object-page', {
            is: NavigateToObjectPage
        });
        document.body.appendChild(element);

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Get handle to button and fire click event
        const buttonEl = element.shadowRoot.querySelectorAll('lightning-button')[1];
        buttonEl.click();

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Check if the mockNavigateTo function was called
        expect(mockNavigateTo).toHaveBeenCalled();

        // Check if the mockNavigateTo function was called with the correct params
        const expectedNavParams = {
            type: NAV_TYPE,
            attributes: {
                objectApiName: OBJECT_NAME,
                actionName: ACTION_NAME
            },
            state: {
                defaultFieldValues: 'FirstName=Jayanth&LastName=Onteru&LeadSource=Other'
            }
        };
        expect(mockNavigateTo).toHaveBeenCalledWith(expectedNavParams);
    });

    it('navigates to list view', async () => {
        // Nav param values to test later
        const NAV_TYPE = 'standard__objectPage';
        const OBJECT_NAME = 'Contact';
        const ACTION_NAME = 'list';

        // Create initial lwc element and attach to virtual DOM
        const element = createElement('c-navigate-to-object-page', {
            is: NavigateToObjectPage
        });
        document.body.appendChild(element);

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Get handle to button and fire click event
        const buttonEl = element.shadowRoot.querySelectorAll('lightning-button')[2];
        buttonEl.click();

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Check if the mockNavigateTo function was called
        expect(mockNavigateTo).toHaveBeenCalled();

        // Check if the mockNavigateTo function was called with the correct params
        const expectedNavParams = {
            type: NAV_TYPE,
            attributes: {
                objectApiName: OBJECT_NAME,
                actionName: ACTION_NAME
            },
            state: {
                filterName: 'Recent'
            }
        };
        expect(mockNavigateTo).toHaveBeenCalledWith(expectedNavParams);
    });

    it('navigates to file', async () => {
        // Nav param values to test later
        const NAV_TYPE = 'standard__objectPage';
        const OBJECT_NAME = 'ContentDocument';
        const ACTION_NAME = 'home';

        // Create initial lwc element and attach to virtual DOM
        const element = createElement('c-navigate-to-object-page', {
            is: NavigateToObjectPage
        });
        document.body.appendChild(element);

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Get handle to button and fire click event
        const buttonEl = element.shadowRoot.querySelectorAll('lightning-button')[3];
        buttonEl.click();

        // Wait for any asynchronous DOM updates
        await flushPromises();

        // Check if the mockNavigateTo function was called
        expect(mockNavigateTo).toHaveBeenCalled();

        // Check if the mockNavigateTo function was called with the correct params
        const expectedNavParams = {
            type: NAV_TYPE,
            attributes: {
                objectApiName: OBJECT_NAME,
                actionName: ACTION_NAME
            }
        };
        expect(mockNavigateTo).toHaveBeenCalledWith(expectedNavParams);
    });
});