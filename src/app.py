import streamlit as st
import pandas as pd
import yfinance as yf
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from datetime import datetime

# YFinance
yf.pdr_override()

# Sidebar menu
st.sidebar.title('Menu')

# Select company from B3 ticker symbols
Empresas = ['PETR4.SA', 'AMER3.SA']
Selecao = st.sidebar.selectbox('Selecione a Empresa:', Empresas)

# Select range in months
Range = st.sidebar.slider('Período de Meses', 0, 12, 1, key='Barra_Selecao')
Selecao_Range = str(Range) + 'mo'

# # Display images
# Imagens = [
#     'data:image/png;base64,...',  # Add your base64 encoded image here
# ]

# Fetch stock data from Yahoo Finance
data = yf.download(Selecao, period=Selecao_Range)

# Create a plotly figure
fig = make_subplots(rows=1, cols=1)
fig.add_trace(go.Scatter(x=data.index, y=data['Close'], mode='lines', name=Selecao))

# Update the layout
fig.update_layout(
    title=f"Stock Price of {Selecao} for the last {Range} months",
    xaxis_title="Date",
    yaxis_title="Price (BRL)",
)

# Show the plot
st.plotly_chart(fig)

# Display the raw data in a table
st.write("Data fetched for", Selecao)
st.dataframe(data)
