import pandas as pd
import plotly.express as px

df = pd.read_csv('bda-t04-ep03-t06-02.csv')
df.head()

XAXIS = 'SAMPLE_DATE'
Y1AXIS = 'TOTAL_USERNAME'
Y2AXIS = 'TOTAL_PGA_USED_MB'

fig1 = px.line(df, x=XAXIS, y=Y1AXIS,title=XAXIS+' vs '+Y1AXIS)
fig1.show()

fig2 = px.line(df, x=XAXIS, y=Y2AXIS,title=XAXIS+' vs '+Y2AXIS)
fig2.show()


