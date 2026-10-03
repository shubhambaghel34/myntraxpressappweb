import React from 'react';
import { render, screen } from '@testing-library/react';
import { MemoryRouter, Route, Routes } from 'react-router-dom';
import { AppProvider } from './context/AppContext';
import ProductDetails from './pages/ProductDetails';
import productsData from './data/products.json';

test('shows recently viewed products on the product detail page', async () => {
  render(
    <AppProvider>
      <MemoryRouter initialEntries={['/product/1']}>
        <Routes>
          <Route path="/product/:productId" element={<ProductDetails products={productsData} />} />
        </Routes>
      </MemoryRouter>
    </AppProvider>
  );

  expect(await screen.findByText(/recently viewed/i)).toBeInTheDocument();
});
